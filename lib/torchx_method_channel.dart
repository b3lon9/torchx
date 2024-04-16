import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'torchx_platform_interface.dart';

/// An implementation of [TorchxPlatform] that uses method channels.
class MethodChannelTorchx extends TorchxPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('torchx');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
