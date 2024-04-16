import 'dart:io';
import 'package:torchx/module/torch_protocol.dart';

import '../bridge/torchx_platform_interface.dart';

class Torch implements TorchProtocol {
  static final double torchLevelMin = Platform.isAndroid ? 1.0 : 0.1;
  static final double torchLevelMax = Platform.isAndroid ? 5.0 : 1.0;

  Torch._();

  static final Torch _instance = Torch._().._init();

  static Torch get instance => _instance;

  @override
  Future<String?> getPlatformVersion() {
    return TorchxPlatform.instance.getPlatformVersion();
  }

  void _init() {
    TorchxPlatform.instance.init();
  }

  @override
  void dispose() {
    TorchxPlatform.instance.dispose();
  }

  @override
  void flashOff() {
    TorchxPlatform.instance.flashOff();
  }

  @override
  void flashOn() {
    TorchxPlatform.instance.flashOn();
  }

  @override
  void flashOnLevel({required double strengthLevel}) {
    TorchxPlatform.instance.flashOnLevel(strengthLevel: strengthLevel);
  }

  @override
  Future<double> getLevel() async {
    return TorchxPlatform.instance.getLevel();
  }

  @override
  void setLevel({required double strengthLevel}) {
    TorchxPlatform.instance.setLevel(strengthLevel: strengthLevel);
  }

  @override
  Future<bool> get isTorched => TorchxPlatform.instance.isTorched;
}
