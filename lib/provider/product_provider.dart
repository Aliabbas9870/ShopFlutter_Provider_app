import 'package:flutter/material.dart';

class ProductNotifier extends ChangeNotifier{
  int _activePage=0;
  List _shoesSize = [];
  int get activePage => _activePage;

  set activePage(int nexIndex){
    _activePage=nexIndex;
    notifyListeners();
  }

set shoesSize(List<dynamic> newShoes){
  _shoesSize=newShoes;
  notifyListeners();}

  void toggleCheck(int index){
    for(int i=0; i<_shoesSize.length; i++){
      if(i==index){
        _shoesSize[i]['isSelect']=!_shoesSize[i]['isSelect'];
      }
    }
  }

}