class Utils {
  static Future<void> delaySecs(double seconds) {
    return Future<void>.delayed(
        Duration(milliseconds: (seconds * 1000).toInt()));
  }
}
