import 'package:flutter/material.dart';
import 'package:hotstar/services/home_backgroundcard_services.dart';

class HomeBackgroundCardProvider with ChangeNotifier {
  String? imageUrl;

  void initializeBackgroundCard() async {
    imageUrl = await HomeBackgroundCardServices().setImage();
    notifyListeners();
  }
}

class HomeScrollProvider extends ChangeNotifier {
  bool isScrolling = true;

  void setIsScrolling(bool value) {
    isScrolling = value;
    notifyListeners();
  }
}

