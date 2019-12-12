import 'dart:async';

import 'package:flutter/services.dart';

class FlutterStickers {
  static const MethodChannel _channel =
      const MethodChannel('flutter_stickers');

  static Future<void> callMethod(Map<String, dynamic> data) async {
    await _channel.invokeMethod('callMethod', data);
  }
}
