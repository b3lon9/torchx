package com.donguran.torchx

import android.annotation.TargetApi
import android.content.Context
import android.hardware.camera2.CameraCharacteristics
import android.hardware.camera2.CameraManager
import android.os.Build
import android.util.Log

@TargetApi(Build.VERSION_CODES.LOLLIPOP)
class TorchController(private val context:Context) {
    // camera manager
    private val cameraManager = context.getSystemService(Context.CAMERA_SERVICE) as CameraManager

    // camera id
    private lateinit var cameraId: String
    private lateinit var cameraFrontId: String

    // current flash level
    private var torchLevel: Int = 0

    // torch state
    private var isTorched = false

    // lens facing front/back


    @TargetApi(Build.VERSION_CODES.M)
    private val torchCallback = object: CameraManager.TorchCallback() {
        override fun onTorchModeUnavailable(cameraId: String) {
            super.onTorchModeUnavailable(cameraId)
        }

        override fun onTorchStrengthLevelChanged(cameraId: String, newStrengthLevel: Int) {
            super.onTorchStrengthLevelChanged(cameraId, newStrengthLevel)
            torchLevel = newStrengthLevel
        }

        override fun onTorchModeChanged(cameraId: String, enabled: Boolean) {
            super.onTorchModeChanged(cameraId, enabled)
            isTorched = enabled
        }
    }

    init {
        try {
            val cameraIds = cameraManager.cameraIdList

            for (id in cameraIds) {
                val characteristics = cameraManager.getCameraCharacteristics(id)
                val lensFacing = characteristics.get(CameraCharacteristics.LENS_FACING)
                if (lensFacing != null && lensFacing == CameraCharacteristics.LENS_FACING_FRONT) {
                    cameraFrontId = id
                }
                if (lensFacing != null && lensFacing == CameraCharacteristics.LENS_FACING_BACK) {
                    cameraId= id
                    break
                }
            }
            // android 8
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                cameraManager.registerTorchCallback(torchCallback, null)
            }
            // android 13
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
                torchLevel = cameraManager.getTorchStrengthLevel(cameraId)
            }
        } catch(e: Exception) {
            e.printStackTrace()
        }
    }

    fun getTorchLevel(): Int = torchLevel

    fun isTorched(): Boolean {
        return isTorched
    }

    fun flashOff() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M && isTorched) {
            cameraManager.setTorchMode(cameraId, false)
        }
    }

    fun flashOn() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M && !isTorched) {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
                flashOn(torchLevel)
            } else {
                cameraManager.setTorchMode(cameraId, true)
            }
        }
    }

    // overloading with torchStrength parameter
    fun flashOn(level: Int) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            torchLevel(level)
            cameraManager.turnOnTorchWithStrengthLevel(cameraId, torchLevel)
        } else {
            flashOn()
        }
    }

    fun torchLevel(level: Int) {
        torchLevel = if (level >= TorchConstant.TORCH_LEVEL_MAX) {
            TorchConstant.TORCH_LEVEL_MAX
        } else if (level <= TorchConstant.TORCH_LEVEL_MIN) {
            TorchConstant.TORCH_LEVEL_MIN
        } else {
            level
        }
    }

    @TargetApi(Build.VERSION_CODES.M)
    fun dispose() {
        cameraManager.unregisterTorchCallback(torchCallback)
        flashOff()
    }
}