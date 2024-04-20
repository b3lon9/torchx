import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_logcat/log/log_extension.dart';
import 'package:torchx/torchx.dart';
import 'package:torchx_example/main_example_helper.dart';
import 'package:flutter_logcat/flutter_logcat.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatefulWidget {
  const ExampleApp({super.key});

  @override
  State<ExampleApp> createState() => _ExampleAppState();
}

class _ExampleAppState extends State<ExampleApp> {
  double level = 0;

  @override
  Widget build(BuildContext context) {
    Log.d("gma???");
    return ExampleAppHelper(
      children: [
        ElevatedButton(
          onPressed: flashOn,
          child: const Text("Torch(Flashlight) - flashOn"),
        ),
        ElevatedButton(
          onPressed: flashOff,
          child: const Text("Torch(Flashlight) - flashOff"),
        ),
        ElevatedButton(
          onPressed: increaseFlashOnLevel,
          child: const Text("Torch(Flashlight) - increaseFlashOnLevel"),
        ),
        ElevatedButton(
          onPressed: decreaseFlashOnLevel,
          child: const Text("Torch(Flashlight) - decreaseFlashOnLevel"),
        ),
        ElevatedButton(
          onPressed: checkTorchLevel,
          child: const Text("Torch(Flashlight) - current torchLevel"),
        ),
        ElevatedButton(
          onPressed: checkTorchState,
          child: const Text("Torch(Flahshlight) - check isTorched"),
        ),
      ]
    );
  }

  void flashOn() async {
    Torch.instance.flashOn();
  }

  void flashOff() {
    Torch.instance.flashOff();
  }

  void increaseFlashOnLevel() async {
    if (Platform.isIOS) {
      level += 0.1;
    } else {
      level++;
    }
    debugPrint("increase level:$level");

    if (level >= Torch.maxLevel) {
      level = Torch.maxLevel;
    }

    Torch.instance.flashOnLevel(strengthLevel: level);
  }

  void decreaseFlashOnLevel() async {
    if (Platform.isIOS) {
     level -= 0.1;
    } else {
      level--;
    }
    debugPrint("decrease level:$level");

    if (level <= Torch.minLevel) {
      level = Torch.minLevel;
    }

    Torch.instance.flashOnLevel(strengthLevel: level);
  }

  void checkTorchLevel() async {
    level = await Torch.instance.getLevel();
    debugPrint("checkTorchLevel - level:$level");
  }

  void checkTorchState() async {
    bool isTorched = await Torch.instance.isTorched;
    debugPrint("checkTorchState - isTorched:$isTorched");
  }
}
