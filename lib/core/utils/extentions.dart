import 'package:flutter/cupertino.dart';

//! Navigation Extensions
extension NavigationRouter on BuildContext {
  /// Used to navigate to another screen
  void navigateToScreen(Widget screen) {
    Navigator.of(this).push(CupertinoPageRoute(builder: (context) => screen));
  }

  /// Navigate to a new screen and dispose the previous one
  void naivateWithReplacepment(Widget screen) {
    Navigator.of(
      this,
    ).pushReplacement(CupertinoPageRoute(builder: (context) => screen));
  }

  /// Used to pop back from the current screen
  void popBackScreen() {
    Navigator.of(this).pop();
  }
}