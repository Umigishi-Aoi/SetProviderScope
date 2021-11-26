import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:setproviderscope/pages_navigator.dart';

import 'provider.dart';

void main() {
  runApp(
    //ProviderScopeあり無しでエラーを確認しよう
    // const MyApp(),
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(builder: (context) {
        int recount = MediaQuery.of(context).size.height.toInt();
        return ProviderScope(
          overrides: [
            counterProvider.overrideWithValue(StateController(recount)),
            counterChangeNotifierProvider.overrideWithValue(Count(1000)),
          ],
          child: const PagesNavigator(),
        );
      }),
    );
  }
}
