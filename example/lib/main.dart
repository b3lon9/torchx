import 'package:flutter/material.dart';
import 'package:torchx/torchx.dart';
import 'package:torchx_example/main_example_helper.dart';

void main() {
  runApp(ExampleApp());
}

class ExampleApp extends StatelessWidget {
  ExampleApp({super.key});

  double level = 0;

  @override
  Widget build(BuildContext context) {
    return exampleColumn(
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
          onPressed: checkTorchState,
          child: const Text("Torch(Flahshlight) - check isTorched"),
        ),
      ]
    );
  }

  void flashOn() {
    Torch.instance.flashOn();
  }

  void flashOff() {
    Torch.instance.flashOff();
  }

  void increaseFlashOnLevel() {
    level++;

    if (level >= Torch.maxLevel) {
      level = Torch.maxLevel;
    }

    Torch.instance.flashOnLevel(strengthLevel: level);
  }

  void decreaseFlashOnLevel() {
    level--;
    
    if (level <= Torch.minLevel) {
      level = Torch.minLevel;
    }

    Torch.instance.flashOnLevel(strengthLevel: level);
  }

  void checkTorchState() async {
    bool isTorched = await Torch.instance.isTorched;
    debugPrint("[donguran].. checkTorchState - isTorched:$isTorched");
  }
}
