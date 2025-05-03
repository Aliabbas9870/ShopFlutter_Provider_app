import 'package:flutter/material.dart';

class ProductNotifier extends ChangeNotifier{
  int _activePage=0;
  int get activePage => _activePage;

  set activePage(int nexIndex){
    _activePage=nexIndex;
    notifyListeners();
  }
}