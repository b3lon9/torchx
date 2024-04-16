import 'package:flutter/material.dart';
import 'package:torchx_example/main.dart';

extension ExampleAppHelper on ExampleApp {
  Widget exampleColumn({required List<Widget> children}) {
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