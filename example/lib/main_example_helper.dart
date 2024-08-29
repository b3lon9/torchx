import 'package:flutter/material.dart';
import 'package:torchx_example/main.dart';

class ExampleAppHelper extends StatelessWidget {
  const ExampleAppHelper({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Torchx"),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: children,
            ),
          ),
        ),
      ),
    );
  }
}
