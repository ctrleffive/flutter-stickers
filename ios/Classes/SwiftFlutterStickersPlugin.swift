import Flutter
import UIKit

public class SwiftFlutterStickersPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_stickers", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterStickersPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    print(call.method)
    result("iOS " + UIDevice.current.systemVersion)
  }
}
