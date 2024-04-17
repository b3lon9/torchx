import Flutter
import UIKit

public class TorchxPlugin: NSObject, FlutterPlugin {
  // Torch state 
  // On:true 
  // Off:false
  var isTorched: Bool = false
  var torchLevel: Float  = 0.0

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "torchx", binaryMessenger: registrar.messenger())
    let instance = TorchxPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case TorchConstant.version:
      result("iOS " + UIDevice.current.systemVersion)
    case TorchCosntant.isTorched:
      result(isTorched)
    case TorchConstant.flashOff:
      self.flashOff()
    case TorchConstant.flashOn:
      if call.arguments != null {
        var level = Float(call.arguments)
        if level >= TorchConstant.TORCH_LEVEL_MAX {
          level = TorchConstant.TORCH_LEVEL_MAX
        } else level <= TorchCOnstant.TORCH_LEVEL_MIN {
          level = TorchConstant.TORCH_LEVEL_MIN
        }
        torchLevel = level
        self.flashOn(level: torchLevel)
      } else {
        if torchLevel == 0 {
          self.flashOn()
        } else {
          self.flashOn(level: torchLevel)
        }
      }
    case TorchConstant.torchLevel:
      if call.arugments != null {
        torchLevel = Float(call.arguments)
      } else {
        result(torchLevel)
      }
    
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
