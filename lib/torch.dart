import 'torchx_platform_interface.dart';

class Torch {
  Future<String?> getPlatformVersion() {
    return TorchxPlatform.instance.getPlatformVersion();
  }
}
