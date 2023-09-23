import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'othello_game_data.freezed.dart';

// オセロのゲームに関するデータをまとめたクラス
@freezed
class OthelloGameData with _$OthelloGameData {
  const factory OthelloGameData({
    // ゲームの盤面の状態
    @Default(OthelloBoardStatus()) OthelloBoardStatus boardStatus,

    // ゲームを続けられる状態かどうか
    @Default(false) bool isGameContinued,

    // 現在のプレイヤー
    @Default(Player.none) Player player,

    // パスの状態
    @Default(PassStatus()) PassStatus passStatus,
  }) = _OthelloGameData;
}

// プレイヤー
enum Player {
  black,
  white,
  none,
  ;

// 自分が持っているセルの状態
  CellState get ownedCell => switch (this) {
        Player.black => CellState.onPutBlackStone,
        Player.white => CellState.onPutWhiteStone,
        Player.none => CellState.empty,
      };

// 自分がひっくり返せるセルの状態
  CellState get reversibleCell => switch (this) {
        Player.black => CellState.onPutWhiteStone,
        Player.white => CellState.onPutBlackStone,
        Player.none => CellState.empty,
      };
}

@freezed
class OthelloBoardStatus with _$OthelloBoardStatus {
  const factory OthelloBoardStatus({
    // 黒石の数
    @Default(0) int blackCellCount,

    // 白石の数
    @Default(0) int whiteCellCount,

    // 各セルの状態
    @Default([[]]) List<List<CellState>> cellsStatus,
  }) = _OthelloBoardStatus;

  static OthelloBoardStatus initial() => const OthelloBoardStatus(
        blackCellCount: 0,
        whiteCellCount: 0,
        cellsStatus: [[]],
      );
}

enum CellState {
  // 黒が置かれている
  onPutBlackStone,

  // 白が置かれている
  onPutWhiteStone,

  // 何も置かれていない
  empty,

  // 現在のプレイヤーが石を置ける
  canPut,
}

@freezed
class PassStatus with _$PassStatus {
  const factory PassStatus({
    // 黒石のプレイヤーのパス回数
    @Default(0) int blackPassCount,

    // 白石のプレイヤーのパス回数
    @Default(0) int whitePassCount,
  }) = _PassStatus;
}
