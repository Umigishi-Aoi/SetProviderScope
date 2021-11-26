import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:setproviderscope/provider.dart';

void showCounterDialog(BuildContext context) {
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
      content: const DialogContent(),
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

class DialogContent extends ConsumerWidget {
  const DialogContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Center(
        child: Text("${ref.watch(counterProvider.state).state}"),
      ),
    );
  }
}
