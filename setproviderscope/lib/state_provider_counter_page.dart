import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'provider.dart';

class StateProviderCounterPage extends ConsumerWidget {
  const StateProviderCounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('StateProvider Counter example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("${ref.watch(counterProvider.state).state}"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.read(counterProvider.state).state++,
        child: const Icon(Icons.add),
      ),
    );
  }
}
