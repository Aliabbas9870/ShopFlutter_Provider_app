import 'package:flutter/material.dart';

class MainViewProvider with ChangeNotifier {
  int _pageIndex = 0;
  int get pageIndex => _pageIndex;
  set pageIdex(int newIndex) {
    _pageIndex = newIndex;
    notifyListeners();
  }
}
