import 'package:flutter/material.dart';
import 'package:othello_vol2/model/data/othello_game_data.dart';
import 'package:othello_vol2/model/page/page_definition.dart';
import 'package:othello_vol2/model/text/text_definition.dart';
import 'package:othello_vol2/view_model/othello_game_state_notifier.dart.dart';

// TODO
// 前の画面に戻った時に「ゲームを終了してよいですか」的なダイアログを出す -> プロバイダーを削除する
// リザルトを表示
// パス機能の実装
// 見た目

class OthelloGamePage extends StatelessWidget {
  const OthelloGamePage(
    this.page,
    this.stateController,
    this.gameStatus, {
    Key? key,
  }) : super(key: key);

  final PageDefinition page;
  final OthelloGameNotifier stateController;
  final OthelloGameData gameStatus;

  @override
  Widget build(BuildContext context) {
    // 盤面に関するWidgetのサイズを決定
    const boardPadding = 5.0;
    final cellSize = (MediaQuery.sizeOf(context).width - boardPadding * 2) / 8; // セル1つの縦横の大きさ

    // 現在のプレイヤーを取得
    final nowPlayer = gameStatus.player;
    final playerText = nowPlayer == Player.black ? TextDefinition.of().turnOfBlack : TextDefinition.of().turnOfWhite;

    // 各石の数を取得
    final blackCellCount = gameStatus.boardStatus.blackCellCount;
    final whiteCellCount = gameStatus.boardStatus.whiteCellCount;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(getPageTitle(page) ?? ''),
      ),
      body: Center(
        child: Column(
          children: [
            // _buildPassButton(stateController, nowPlayer), パス機能未実装
            const Spacer(),
            Text(playerText),
            Padding(
              padding: const EdgeInsets.all(boardPadding),
              child: _buildOthelloBoard(cellSize, stateController, gameStatus),
            ),
            Text('${TextDefinition.of().blackCellCountText(blackCellCount)},${TextDefinition.of().whiteCellCountText(whiteCellCount)}'),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  // 盤面
  Widget _buildOthelloBoard(double size, OthelloGameNotifier stateController, OthelloGameData gameStatus) {
    List<Widget> board = [];

    for (int x = 0; x < 8; x++) {
      List<Widget> rowOfCell = [];
      for (int y = 0; y < 8; y++) {
        final cell = _buildOthelloCell(x, y, size, stateController, gameStatus);
        rowOfCell.add(cell);
      }
      board.add(Row(children: rowOfCell));
    }

    return Column(children: board);
  }

  // マス目
  Widget _buildOthelloCell(int x, int y, double size, OthelloGameNotifier stateController, OthelloGameData gameStatus) {
    return InkWell(
      onTap: () => stateController.onPutCell(x, y),
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 21, 126, 23),
          border: Border.all(width: 0.4),
        ),
        child: Stack(
          children: [
            _buildCell(gameStatus.boardStatus.cellsStatus, x, y),
            // Text('($x,$y)'), デバック用に座標を表示する
          ],
        ),
      ),
    );
  }

  Widget _buildCell(List<List<CellState>> cellStatus, int x, int y) {
    switch (cellStatus[x][y]) {
      case CellState.empty:
        return const SizedBox.shrink();
      case CellState.canPut:
        return _buildOthelloStone(Colors.black.withOpacity(0.3));
      case CellState.onPutBlackStone:
        return _buildOthelloStone(Colors.black);
      case CellState.onPutWhiteStone:
        return _buildOthelloStone(Colors.white);
    }
  }

  // 石の見た目
  Widget _buildOthelloStone(Color stoneColor) {
    return Container(margin: const EdgeInsets.all(2), decoration: BoxDecoration(shape: BoxShape.circle, color: stoneColor));
  }

  // パスボタン
  Widget _buildPassButton(OthelloGameNotifier stateController, Player player) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ElevatedButton(
        onPressed: () => stateController.onPressedPassButton(player),
        style: ElevatedButton.styleFrom(foregroundColor: Colors.black),
        child: Text(TextDefinition.of().passButtonText),
      ),
    );
  }
}
