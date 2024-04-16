package com.donguran.torchx

import android.content.Context
import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** TorchxPlugin */
class TorchxPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private lateinit var context: Context
  private var torchController: TorchController? = null

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "torchx")
    channel.setMethodCallHandler(this)

    context = flutterPluginBinding.applicationContext
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == TorchConstant.version) {
      result.success("Android ${android.os.Build.VERSION.RELEASE}")
    } else if (call.method == TorchConstant.init) {
      torchController = torchController ?: TorchController(context)
    } else if (call.method == TorchConstant.isTorched) {
      result.success(torchController?.isTorched())
    } else if (call.method == TorchConstant.flashOn) {
      if (call.arguments != null) {
        torchController?.flashOn(level = (call.arguments as Double).toInt())
      } else {
        torchController?.flashOn()
      }
    } else if (call.method == TorchConstant.flashOff) {
      torchController?.flashOff()
    } else if (call.method == TorchConstant.torchLevel) {
      if (call.arguments != null) {
        torchController?.torchLevel((call.arguments as Double).toInt())
      } else {
        result.success(torchController?.getTorchLevel())
      }
    } else if (call.method == TorchConstant.dispose) {
      torchController?.dispose()
      torchController = null
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
