interface class TorchProtocol {
  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<bool> get isTorched async => throw UnimplementedError("isTorched has not been implemented.");

  void flashOn() => throw UnimplementedError("flashOn has not been implemented.");
  void flashOff() => throw UnimplementedError("flashOff has not been implemented.");

  void flashOnLevel({required double strengthLevel}) => throw UnimplementedError("flashOnLevel has not been implemented.");

  void setLevel({required double strengthLevel}) => throw UnimplementedError("setTorchLevel has not been implemented.");
  Future<double> getLevel() => throw UnimplementedError("getTorchLevel has not been implemeneted.");
  void dispose() => throw UnimplementedError("dispose has not been implemented.");
}