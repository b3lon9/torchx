import Foundation

struct TorchConstant {
    static let version = "getPlatformVersion"
    static let create = "init"

    static let flashOn = "flashOn"
    static let flashOff = "flashOff"
    static let torchLevel = "torchLevel"
    static let isTorched = "isTorched"

    static let dispose = "dispose"

    static let TORCH_LEVEL_MIN: Float = 0.1
    static let TORCH_LEVEL_MAX: Float = 1.0
}