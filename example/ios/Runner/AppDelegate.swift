import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    
    var isTorched: Bool = false
    var torchLevel: Float  = 0.0
    
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      
//       let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
//       let batteryChannel = FlutterMethodChannel(name: "samples.flutter.dev/battery",
//                                                 binaryMessenger: controller.binaryMessenger)
      
//       batteryChannel.setMethodCallHandler({
//         [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
//         // This method is invoked on the UI thread.
// //        guard call.method == "getBatteryLevel" else {
// //          result(FlutterMethodNotImplemented)
// //          return
// //        }
//           switch call.method {
//           case TorchConstant.version:
//                 result("iOS " + UIDevice.current.systemVersion)
//                 break
//               case TorchConstant.isTorched:
//                 result(self?.isTorched)
//               print("torched:", self?.isTorched)
//                 break
//               case TorchConstant.flashOff:
//                 self?.flashOff()
//                 break
//               case TorchConstant.flashOn:
//                   if let arguments = call.arguments! as? Float {
//                       let level: Float = arguments
//                       if level >= TorchConstant.TORCH_LEVEL_MAX {
//                           self?.torchLevel = TorchConstant.TORCH_LEVEL_MAX
//                       } else if level <= TorchConstant.TORCH_LEVEL_MIN {
//                           self?.torchLevel = TorchConstant.TORCH_LEVEL_MIN
//                       } else {
//                           self?.torchLevel = level
//                       }
//                       self?.flashOn(level: self?.torchLevel ?? 0.0)
//                   } else {
//                       if self?.torchLevel == 0 {
//                           self?.flashOn()
//                       } else {
//                           self?.flashOn(level: self?.torchLevel ?? 0.0)
//                       }
//                   }
//                   break
//               case TorchConstant.torchLevel:
//                 if let arguments = call.arguments as? Float {
//                     self?.torchLevel = arguments
//                     print("torchLevel setter")
//                 } else {
//                     result(self?.torchLevel)
//                     print("torchLevel getter")
//                 }
//                 break
//           case "getBatteryLevel":
//               print("call.arguments == nil : ", (call.arguments == nil))
//               print("call.arguments : ", call.arguments)
//               print("type(of: call.arguments) : ", type(of: call.arguments))
//               print("call.arguments! : ", call.arguments!)
//               print("type(of: call.arguments!) : ", type(of: call.arguments!))
//               if let testNumber = call.arguments! as? Double {
//                   print("testNumber : ", testNumber)
//                   print("type(of: testNumber) : ", type(of: testNumber))
//               }
//               self?.receiveBatteryLevel(result: result)
//
//           default:
//               result(FlutterMethodNotImplemented)
//           }
//
//
//
//         // self?.receiveBatteryLevel(result: result)
//       })
      
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    private func receiveBatteryLevel(result: FlutterResult) {
      let device = UIDevice.current
      device.isBatteryMonitoringEnabled = true
      if device.batteryState == UIDevice.BatteryState.unknown {
        result(FlutterError(code: "UNAVAILABLE",
                            message: "Battery level not available.",
                            details: nil))
      } else {
        result(Int(device.batteryLevel * 100))
      }
    }
}
