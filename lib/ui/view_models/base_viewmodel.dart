import 'package:blissemojiapp/core/locator.dart';
import 'package:blissemojiapp/core/services/navigator_service.dart';
import 'package:flutter/material.dart';


abstract class BaseViewModel with ChangeNotifier {
  final NavigatorService navigatorService = getIt<NavigatorService>();

  bool _busy = false;

  bool get busy => _busy;

  set busy(bool state) {
    _busy = state;

    notifyListeners();
  }
}
