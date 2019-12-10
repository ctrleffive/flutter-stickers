import Flutter
import UIKit

public class SwiftFlutterStickersPlugin: NSObject, FlutterPlugin {
  private static let DefaultBundleIdentifier: String = "WA.WAStickersThirdParty"
  private static let WhatsAppURL: URL = URL(string: "whatsapp://stickerPack")!

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_stickers", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterStickersPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
    }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    let pasteboard: UIPasteboard = UIPasteboard.general
    let jsonData: [String: Any] = call.arguments as! [String: Any]
    let PasteboardStickerPackDataType: String = Bundle.main.bundleIdentifier!
    
    let dataToSend: Data = try! JSONSerialization.data(withJSONObject: jsonData, options: [])
    
    if #available(iOS 10.0, *) {
      pasteboard.setItems([[PasteboardStickerPackDataType: dataToSend]], options: [UIPasteboardOption.localOnly: true, UIPasteboardOption.expirationDate: NSDate(timeIntervalSinceNow: 60)])
    } else {
      pasteboard.setData(dataToSend, forPasteboardType: PasteboardStickerPackDataType)
    }
    
    DispatchQueue.main.async {
      if #available(iOS 10.0, *) {
          UIApplication.shared.open(SwiftFlutterStickersPlugin.WhatsAppURL, options: [:], completionHandler: nil)
      } else {
          UIApplication.shared.openURL(SwiftFlutterStickersPlugin.WhatsAppURL)
      }
    }
    
    result(true)
  }
}
