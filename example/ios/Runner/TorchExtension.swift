//
//  TorchExtension.swift
//  Runner
//
//  Created by donguran on 4/19/24.
//

import Foundation
import AVFoundation

extension AppDelegate {
    func isAvailableTorch() -> Bool {
            var isAvailable = false
            
            if let device = AVCaptureDevice.default(for: AVMediaType.video) {
                isAvailable = device.isTorchAvailable
            }

            return isAvailable
        }

        func flashOff() {
            if let device = AVCaptureDevice.default(for: AVMediaType.video) {
                do {
                    try device.lockForConfiguration()
                    device.torchMode = .off
                    device.unlockForConfiguration()

                    isTorched = false
                } catch {
                    
                }
            }
        }

        func flashOn() {
            if let device = AVCaptureDevice.default(for: AVMediaType.video) {
                do {
                    try device.lockForConfiguration()
                    device.torchMode = .on
                    device.unlockForConfiguration()

                    isTorched = true
                } catch {
                    isTorched = false
                }
            }
        }

        func flashOn(level torchLevel:Float) {
            if let device = AVCaptureDevice.default(for: AVMediaType.video) {
                do {
                    try device.lockForConfiguration()
                    try device.setTorchModeOn(level: torchLevel)

                    device.unlockForConfiguration()
                    
                    isTorched = true
                } catch {
                    isTorched = false
                }
            }
        }
}
