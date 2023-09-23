import 'package:flutter/material.dart';
import 'package:othello_vol2/model/page/page_definition.dart';
import 'package:othello_vol2/model/text/text_definition.dart';

class HomePage extends StatelessWidget {
  const HomePage(this.page, {Key? key}) : super(key: key);

  final PageDefinition page;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(getPageTitle(page) ?? ''),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 120),
            Text(TextDefinition.of().gameTitle, style: const TextStyle(fontSize: 25)),
            const Spacer(),
            //selectGameModeButton(context, null, 'ひとりであそぶ'), // 未実装
            selectGameModeButton(context, PageDefinition.playedByTwoGamePage.name, TextDefinition.of().playedByTowGameTitle),
            const SizedBox(height: 150),
          ],
        ),
      ),
    );
  }

  Widget selectGameModeButton(BuildContext context, String? pushName, String text) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ElevatedButton(
        onPressed: pushName != null ? () => Navigator.of(context).pushNamed(pushName) : null,
        style: ElevatedButton.styleFrom(foregroundColor: Colors.black),
        child: Text(text),
      ),
    );
  }
}
