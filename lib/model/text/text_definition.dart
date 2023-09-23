class TextDefinition {
  static TextDefinition of() {
    return TextDefinition();
  }

  ///
  /// ホーム画面/AppBarに表示する文言
  ///

  String gameTitle = 'オセロ';

  String playedByTowGameTitle = 'ふたりであそぶ';

  ///
  /// オセロゲーム内の文言
  ///

  String turnOfBlack = '黒のターン';
  String turnOfWhite = '白のターン';

  String blackCellCountText(int count) => '黒：$count';
  String whiteCellCountText(int count) => '白：$count';

  String passButtonText = 'パス';
}
