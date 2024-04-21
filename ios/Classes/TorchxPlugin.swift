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
      break

    case TorchConstant.flashOff:
     self.flashOff()
     break

    case TorchConstant.flashOn:

    // print("call.argments:" , call.arguments)
        if let level = call.arguments as? Double {
            if Float(level) >= TorchConstant.TORCH_LEVEL_MAX {
                torchLevel = TorchConstant.TORCH_LEVEL_MAX
            } else if Float(level) <= TorchConstant.TORCH_LEVEL_MIN {
                torchLevel = TorchConstant.TORCH_LEVEL_MIN
            } else {
                torchLevel = Float(level)
            }
            self.flashOn(level: torchLevel)
        } else {
            if torchLevel == 0 {
                self.flashOn()
            } else {
                self.flashOn(level: torchLevel)
            }
        }
      break

    case TorchConstant.isTorched:
      result(isTorched)
      break

    case TorchConstant.torchLevel:
        if let level = call.arguments as? Double {
            torchLevel = Float(level)
            // print("setter - torchLevel:", torchLevel)
        } else {
            result(Double(torchLevel))
            // print("getter - torchLevel:", torchLevel)
        }
        break
    default:
      result(FlutterMethodNotImplemented)
      break
    }
  }
}
