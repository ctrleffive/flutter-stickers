import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:intent/intent.dart';

class FlutterStickers {
  static const MethodChannel _channel =
      const MethodChannel('flutter_stickers');

  static Future<void> callMethod(Map<String, dynamic> data) async {
    if (Platform.isIOS) {
      await _channel.invokeMethod('callMethod', data);
    }
    if (Platform.isAndroid) {
      final Intent intent = Intent();

      intent.setAction("com.whatsapp.intent.action.ENABLE_STICKER_PACK");
      intent.putExtra("sticker_pack_id", '1');
      intent.putExtra("sticker_pack_authority", 'authority');
      intent.putExtra("sticker_pack_name", 'Sticker Pack Name');

      intent.startActivity();
    }
  }
}
