import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_stickers/flutter_stickers.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  Future<void> initPlatformState() async {
    try {
      await FlutterStickers.callMethod;
    } on PlatformException {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: MaterialButton(
            onPressed: this.initPlatformState,
            child: Text('Check'),
          ),
        ),
      ),
    );
  }
}
