import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:torchx/module/torch_protocol.dart';

import '../bridge/torchx_platform_interface.dart';

/// An implementation of [TorchxPlatform] that uses method channels.
class MethodChannelTorchx extends TorchxPlatform implements TorchProtocol{
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('torchx');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  void init() {
    methodChannel.invokeMethod(_TorchConstant.init);
  }

  @override
  void flashOff() async {
    await methodChannel.invokeMethod<void>(_TorchConstant.flashOff);
  }

  @override
  void flashOn() async {
    await methodChannel.invokeMethod<void>(_TorchConstant.flashOn);
  }

  @override
  void flashOnLevel({required double strengthLevel}) {
    methodChannel.invokeMethod<void>(_TorchConstant.flashOn, strengthLevel);
  }

  @override
  Future<bool> get isTorched async {
    return await methodChannel.invokeMethod<bool>(_TorchConstant.isTorched) ?? false;
  }

  @override
  Future<double> getLevel() async {
    return await methodChannel.invokeMethod<double>(_TorchConstant.torchLevel) ?? -1;
  }

  @override
  void setLevel({required double strengthLevel}) {
    methodChannel.invokeMethod<int>(_TorchConstant.torchLevel, strengthLevel);
  }

  @override
  void dispose() {
    methodChannel.invokeMethod<void>(_TorchConstant.dispose);
  }
}

class _TorchConstant {
  static const String version = 'getPlatformVersion';
  static const String init = 'init';

  static const String flashOn = 'flashOn';
  static const String flashOff = 'flashOff';
  static const String torchLevel = 'torchLevel';
  static const String isTorched = 'isTorched';
  static const String dispose = 'dispose';
}