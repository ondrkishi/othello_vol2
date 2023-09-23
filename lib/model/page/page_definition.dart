import 'package:flutter/material.dart';
import 'package:othello_vol2/model/text/text_definition.dart';
import 'package:othello_vol2/view/home/home.dart';
import 'package:othello_vol2/view/played_by_two/played_by_two.dart';

// 画面の定義
enum PageDefinition {
  home,
  playedByTwoGamePage,
}

// 画面名の取得
String? getPageTitle(PageDefinition page) {
  return switch (page) {
    PageDefinition.home => null,
    PageDefinition.playedByTwoGamePage => TextDefinition.of().playedByTowGameTitle,
  };
}

// MaterialAppで使用する画面のroute
Map<String, Widget Function(BuildContext)> routes = {
  PageDefinition.home.name: (context) => const HomePage(PageDefinition.home),
  PageDefinition.playedByTwoGamePage.name: (context) => const PlayedByTwoGamePage(PageDefinition.playedByTwoGamePage),
};
