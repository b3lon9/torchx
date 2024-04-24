import 'dart:io';
import '../module/torch_protocol.dart';

import '../bridge/torchx_platform_interface.dart';

/// Welcome Torch library world.
///
/// I used torch implement to native application until now.
/// think to torch implement How about it apply to Flutter people.
///
/// so I made this Torchx Library :)
class Torch implements TorchProtocol {
  /// [minLevel]
  /// Android = 1.0 (Integer)
  /// IOS = 0.1 (Float)
  static final double minLevel = Platform.isAndroid ? 1.0 : 0.1;

  /// [maxLevel]
  /// Android = 5.0 (Integer)
  /// IOS = 1.0 (Float)
  static final double maxLevel = Platform.isAndroid ? 5.0 : 1.0;

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

  /// [dispose]
  /// exit your application include dispose method before
  /// define super.dispose method
  @override
  void dispose() {
    TorchxPlatform.instance.dispose();
  }

  /// [flashOff]
  /// device Torch(FlashLight) 'OFF' Function
  ///
  /// [usage]
  /// - Torch.instance.flashOff();
  @override
  void flashOff() {
    TorchxPlatform.instance.flashOff();
  }

  /// [flashOn]
  /// device Torch(FlashLight) 'ON' Function
  ///
  /// [usage]
  /// - Torch.instance.flashOn();
  @override
  void flashOn() {
    TorchxPlatform.instance.flashOn();
  }

  /// [flashOnLevel]
  /// device Torch(FlashLight) 'ON' with control strengthLevel(torch level)
  ///
  /// Android : [Build.VERSION.SDK_INT > Build.VERSION_CODES.TIRAMISU]
  /// IOS : iOS > 11.4
  ///
  /// [usage]
  /// - Torch.instance.flashOnLevel(strengthLevel: [double])
  @override
  void flashOnLevel({required double strengthLevel}) {
    TorchxPlatform.instance.flashOnLevel(strengthLevel: strengthLevel);
  }

  /// [getLevel]
  /// you can get current device torch's strengthLevel(torch level, flashlight level)
  @override
  Future<double> getLevel() async {
    return TorchxPlatform.instance.getLevel();
  }

  /// [setLevel]
  /// you can put device's torch level
  /// before [flashOn] function effect torch level
  @override
  void setLevel({required double strengthLevel}) {
    TorchxPlatform.instance.setLevel(strengthLevel: strengthLevel);
  }

  /// [isTorched]
  ///
  /// you can know that current device's torch state
  /// if device's flashOn so [isTorched] return 'true'
  /// if device's flashOff so [isTorched] return 'false'
  @override
  Future<bool> get isTorched => TorchxPlatform.instance.isTorched;
}
