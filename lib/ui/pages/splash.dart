import 'package:app_logs/app_logs.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  final l = AppLogger.forTag('SplashPage');

  @override
  Widget build(BuildContext context) {
    l.v('.build()');
    return const Scaffold(
      body: Center(
        child: Text(
          '...',
          textScaleFactor: 2,
        ),
      ),
    );
  }
}
