import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'provider.dart';

class ChangeNotifierProviderCounterPage extends ConsumerWidget {
  const ChangeNotifierProviderCounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('ChangeNotifierProvider example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                child: const Text("Show Dialog"),
                onPressed: () {
                  showDialog<void>(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Center(
                        child: Text(
                          "Dialog",
                          style: TextStyle(
                            fontSize: 24,
                          ),
                        ),
                      ),
                      content: SingleChildScrollView(
                        child: Center(
                            child: Text("${ref.watch(counterChangeNotifierProvider).count}")
                        ),
                      ),
                      actions: <Widget>[
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("back"),
                          ),
                        )
                      ],
                    ),
                  );
                }
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.read(counterChangeNotifierProvider.notifier).increment(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
