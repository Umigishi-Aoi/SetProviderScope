import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'pages_navigator.dart';
import 'show_counter_dialog.dart';

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Provider Scope example"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                child: const Text("Show Dialog"),
                onPressed: () {
                  showCounterDialog(context);
                }
              ),
              ElevatedButton(
                child: const Text("State Provider Counter"),
                onPressed: () {
                  ref.read(pageStateProvider.state).state = PageState.stateProvider;
                },
              ),
              ElevatedButton(
                child: const Text("Change Notifier Provider Counter"),
                onPressed: () {
                  ref.read(pageStateProvider.state).state = PageState.changeNotifierProvider;
                },
              ),
            ],
          ),
        ));
  }
}
