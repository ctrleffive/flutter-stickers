import 'dart:async';

import 'package:flutter/services.dart';

class FlutterStickers {
  static const MethodChannel _channel =
      const MethodChannel('flutter_stickers');

  static Future<String> get callMethod async {
    final String version = await _channel.invokeMethod('callMethod');
    return version;
  }
}
