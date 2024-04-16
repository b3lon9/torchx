import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:torchx/module/torch_protocol.dart';

import '../bridge/torchx_method_channel.dart';

abstract class TorchxPlatform extends PlatformInterface implements TorchProtocol {
  /// Constructs a TorchxPlatform.
  TorchxPlatform() : super(token: _token);

  static final Object _token = Object();

  static TorchxPlatform _instance = MethodChannelTorchx();

  /// The default instance of [TorchxPlatform] to use.
  ///
  /// Defaults to [MethodChannelTorchx].
  static TorchxPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [TorchxPlatform] when
  /// they register themselves.
  static set instance(TorchxPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  void init() {
    throw UnimplementedError('init() has not been implemented.');
  }
}
