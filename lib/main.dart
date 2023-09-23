import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:othello_vol2/model/page/page_definition.dart';
import 'package:othello_vol2/view/home/home.dart';

void main() {
  runApp(const ProviderScope(child: Othello()));
}

class Othello extends StatelessWidget {
  const Othello({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Othello',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(PageDefinition.home),
      routes: routes,
    );
  }
}
