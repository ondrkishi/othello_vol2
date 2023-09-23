import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:othello_vol2/model/page/page_definition.dart';
import 'package:othello_vol2/view/common/othello_game_page.dart';
import 'package:othello_vol2/view_model/othello_game_state_notifier.dart.dart';

// 「ふたりであそぶ」画面
class PlayedByTwoGamePage extends ConsumerWidget {
  const PlayedByTwoGamePage(this.page, {Key? key}) : super(key: key);

  final PageDefinition page;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // プロバイターの準備
    final stateController = ref.read(playWithTowGameProvider.notifier);
    final gameStatus = ref.watch(playWithTowGameProvider);

    return OthelloGamePage(page, stateController, gameStatus);
  }
}
