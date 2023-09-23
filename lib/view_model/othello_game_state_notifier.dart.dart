import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:othello_vol2/model/data/othello_game_data.dart';

// 「ふたりで遊ぶ」用のプロバイダー
final playWithTowGameProvider = StateNotifierProvider<OthelloGameNotifier, OthelloGameData>((ref) {
  return OthelloGameNotifier()..initialize();
});

// オセロのゲーム状態を管理するNotifier
class OthelloGameNotifier extends StateNotifier<OthelloGameData> {
  OthelloGameNotifier() : super(const OthelloGameData());

  // ここで必要なイベントを追加して[state]を更新する -> readしているWidgetで更新がかかる

  // ゲームを始めるために各データを初期化する
  void initialize() {
    const firstPlayer = Player.black;

    OthelloBoardStatus boardStatus = OthelloBoardStatus.initial();
    List<List<CellState>> cellStatus = [];

    // セルの初期状態を設定する
    for (int x = 0; x < 8; x++) {
      final List<CellState> row = [];
      for (int y = 0; y < 8; y++) {
        if ((x == 3 && y == 3) || (x == 4 && y == 4)) {
          // 初期値で黒石を置く
          row.add(CellState.onPutBlackStone);
        } else if ((x == 3 && y == 4) || (x == 4 && y == 3)) {
          row.add(CellState.onPutWhiteStone);
          // 初期値で白石を置く
        } else {
          row.add(CellState.empty);
        }
      }
      cellStatus.add(row);
    }

    // 最初のプレイヤーが置けるセルを検索してcellStatusに反映する
    cellStatus = searchCanPutCell(firstPlayer, cellStatus);

    // 各石の置かれている数を算出する
    final blackCellCount = countTargetCellCount(Player.black, cellStatus);
    final whiteCellCount = countTargetCellCount(Player.white, cellStatus);

    state = state.copyWith(
      boardStatus: boardStatus.copyWith(
        blackCellCount: blackCellCount,
        whiteCellCount: whiteCellCount,
        cellsStatus: cellStatus,
      ),
      isGameContinued: true,
      player: firstPlayer,
      passStatus: const PassStatus(),
    );
  }

  // セルが置かれた時のイベント
  void onPutCell(int x, int y) {
    final nowStatus = state;
    if (nowStatus.boardStatus.cellsStatus[x][y] == CellState.canPut) {
      final nowPlayer = nowStatus.player;

      // 1.プレイヤーを入れ替える
      final nextPlayer = nowPlayer == Player.black ? Player.white : Player.black;

      // 2.石を置く
      List<List<CellState>> updateCellStatus = nowStatus.boardStatus.cellsStatus;
      updateCellStatus[x][y] = nowPlayer.ownedCell;

      // 3.石をひっくり返す
      final reversibleCells = _returnReversibleCells(nowPlayer, x, y, updateCellStatus);
      for (int i = 0; i < reversibleCells.length; i++) {
        updateCellStatus[reversibleCells[i].x][reversibleCells[i].y] = nowPlayer.ownedCell;
      }

      // 4.次のプレイヤーが置ける座標を取得してupdateCellStatusに反映する
      updateCellStatus = searchCanPutCell(nextPlayer, updateCellStatus);

      // 5.各プレイヤーが持っている石の数を取得する
      final blackCellCount = countTargetCellCount(Player.black, updateCellStatus);
      final whiteCellCount = countTargetCellCount(Player.white, updateCellStatus);

      // 6.更新したデータをstateに反映
      state = nowStatus.copyWith(
        player: nextPlayer,
        boardStatus: nowStatus.boardStatus.copyWith(
          cellsStatus: updateCellStatus,
          blackCellCount: blackCellCount,
          whiteCellCount: whiteCellCount,
        ),
      );
    }
  }

  // 指定したプレイヤーが持っている石の数を返す
  int countTargetCellCount(Player target, List<List<CellState>> cellStatus) {
    return cellStatus.expand((e) => e).where((e) => e == target.ownedCell).toList().length;
  }

  // 指定した色のプレイヤーが置けるセルを検索、cellStatusに反映させて返す
  List<List<CellState>> searchCanPutCell(Player player, List<List<CellState>> cellStatus) {
    List<List<CellState>> updateStatus = cellStatus;

    for (int x = 0; x < 8; x++) {
      for (int y = 0; y < 8; y++) {
        if (cellStatus[x][y] == CellState.onPutBlackStone || cellStatus[x][y] == CellState.onPutWhiteStone) {
          // すでに石が置かれているセルについては検索を行わない
          continue;
        } else {
          // 前のプレイヤーのcanPutが残っているので一旦emptyに戻す
          updateStatus[x][y] = CellState.empty;
          // ひっくり返せるセルが1つでも存在するならCellStateをcanPutに更新する
          final reversible = _returnReversibleCells(player, x, y, updateStatus).isNotEmpty;
          if (reversible) updateStatus[x][y] = CellState.canPut;
        }
      }
    }
    return updateStatus;
  }

  // パスボタンが押された時のイベント
  void onPressedPassButton(Player player) {
    // TODO
  }

  //
  // --------------------------------------------------
  // 以降は石をひっくり返せるかのチェックを行う処理
  // --------------------------------------------------
  //
  // ひっくり返せる石の座標リストを返す
  List<_Coordinate> _returnReversibleCells(Player player, int x, int y, List<List<CellState>> cellStatus) {
    List<_Coordinate> reversibleCells = [];
    reversibleCells.addAll(_checkLeft(player, x, y, cellStatus));
    reversibleCells.addAll(_checkRight(player, x, y, cellStatus));
    reversibleCells.addAll(_checkTop(player, x, y, cellStatus));
    reversibleCells.addAll(_checkBottom(player, x, y, cellStatus));
    reversibleCells.addAll(_checkTopLeft(player, x, y, cellStatus));
    reversibleCells.addAll(_checkTopRight(player, x, y, cellStatus));
    reversibleCells.addAll(_checkBottomLeft(player, x, y, cellStatus));
    reversibleCells.addAll(_checkBottomRight(player, x, y, cellStatus));
    return reversibleCells;
  }

  List<_Coordinate> _checkLeft(Player player, int x, int y, List<List<CellState>> perviousCellsStatus) {
    List<_Coordinate> list = [];
    bool hit = false;

    // 置いた石のy座標が0or1の場合左側をひっくり返すことはできないためそもそもチェックしない
    if (y > 1) {
      for (int t = y - 1; t > 0; t--) {
        if (perviousCellsStatus[x][t] == player.reversibleCell) {
          list.add(_Coordinate(x: x, y: t));
          hit = true;
        } else if (perviousCellsStatus[x][t] == player.ownedCell) {
          if (hit) return list;
        } else {
          break;
        }
      }
    }
    return [];
  }

  List<_Coordinate> _checkRight(Player player, int x, int y, List<List<CellState>> perviousCellsStatus) {
    List<_Coordinate> list = [];
    bool hit = false;

    // 置いた石のy座標が6or7の場合右側をひっくり返すことはできないためそもそもチェックしない
    if (y < 6) {
      for (int t = y + 1; t < 7; t++) {
        if (perviousCellsStatus[x][t] == player.reversibleCell) {
          list.add(_Coordinate(x: x, y: t));
          hit = true;
        } else if (perviousCellsStatus[x][t] == player.ownedCell) {
          if (hit) return list;
        } else {
          break;
        }
      }
    }
    return [];
  }

  List<_Coordinate> _checkTop(Player player, int x, int y, List<List<CellState>> perviousCellsStatus) {
    List<_Coordinate> list = [];
    bool hit = false;

    // 置いた石のx座標が0or2の場合上側をひっくり返すことはできないためそもそもチェックしない
    if (x > 2) {
      for (int t = x - 1; t > 0; t--) {
        if (perviousCellsStatus[t][y] == player.reversibleCell) {
          list.add(_Coordinate(x: t, y: y));
          hit = true;
        } else if (perviousCellsStatus[t][y] == player.ownedCell) {
          if (hit) return list;
        } else {
          break;
        }
      }
    }
    return [];
  }

  List<_Coordinate> _checkBottom(Player player, int x, int y, List<List<CellState>> perviousCellsStatus) {
    List<_Coordinate> list = [];
    bool hit = false;

    // 置いた石のx座標が6or7の場合下側をひっくり返すことはできないためそもそもチェックしない
    if (x < 6) {
      for (int t = x + 1; t < 7; t++) {
        if (perviousCellsStatus[t][y] == player.reversibleCell) {
          list.add(_Coordinate(x: t, y: y));
          hit = true;
        } else if (perviousCellsStatus[t][y] == player.ownedCell) {
          if (hit) return list;
        } else {
          break;
        }
      }
    }
    return [];
  }

  List<_Coordinate> _checkTopLeft(Player player, int x, int y, List<List<CellState>> perviousCellsStatus) {
    List<_Coordinate> list = [];
    bool hit = false;

    // 置いた石のx座標が0or1、y座標が0or1の場合左上をひっくり返すことはできないためそもそもチェックしない
    if (x > 1 && y > 1) {
      for (int tx = x - 1, ty = y - 1; tx > 0 && ty > 0; tx--, ty--) {
        if (perviousCellsStatus[tx][ty] == player.reversibleCell) {
          list.add(_Coordinate(x: tx, y: ty));
          hit = true;
        } else if (perviousCellsStatus[tx][ty] == player.ownedCell) {
          if (hit) return list;
        } else {
          break;
        }
      }
    }
    return [];
  }

  List<_Coordinate> _checkTopRight(Player player, int x, int y, List<List<CellState>> perviousCellsStatus) {
    List<_Coordinate> list = [];
    bool hit = false;

    // 置いた石のx座標が0or1、y座標が6or7の場合右上をひっくり返すことはできないためそもそもチェックしない
    if (x > 1 && y < 6) {
      for (int tx = x - 1, ty = y + 1; tx > 0 && ty < 7; tx--, ty++) {
        if (perviousCellsStatus[tx][ty] == player.reversibleCell) {
          list.add(_Coordinate(x: tx, y: ty));
          hit = true;
        } else if (perviousCellsStatus[tx][ty] == player.ownedCell) {
          if (hit) return list;
        } else {
          break;
        }
      }
    }
    return [];
  }

  List<_Coordinate> _checkBottomLeft(Player player, int x, int y, List<List<CellState>> perviousCellsStatus) {
    List<_Coordinate> list = [];
    bool hit = false;

    // 置いた石のx座標が6or7、y座標が0or1の場合左下をひっくり返すことはできないためそもそもチェックしない
    if (x < 6 && y > 1) {
      for (int tx = x + 1, ty = y - 1; tx < 7 && ty > 0; tx++, ty--) {
        if (perviousCellsStatus[tx][ty] == player.reversibleCell) {
          list.add(_Coordinate(x: tx, y: ty));
          hit = true;
        } else if (perviousCellsStatus[tx][ty] == player.ownedCell) {
          if (hit) return list;
        } else {
          break;
        }
      }
    }
    return [];
  }

  List<_Coordinate> _checkBottomRight(Player player, int x, int y, List<List<CellState>> perviousCellsStatus) {
    List<_Coordinate> list = [];
    bool hit = false;

    // 置いた石のx座標が6or7、y座標が6or7の場合左下をひっくり返すことはできないためそもそもチェックしない
    if (x < 6 && y < 6) {
      for (int tx = x + 1, ty = y + 1; tx < 8 && ty < 8; tx++, ty++) {
        if (perviousCellsStatus[tx][ty] == player.reversibleCell) {
          list.add(_Coordinate(x: tx, y: ty));
          hit = true;
        } else if (perviousCellsStatus[tx][ty] == player.ownedCell) {
          if (hit) return list;
        } else {
          break;
        }
      }
    }
    return [];
  }
}

// 座標データ
class _Coordinate {
  const _Coordinate({
    required this.x,
    required this.y,
  });

  final int x;
  final int y;
}
