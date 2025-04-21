import 'package:flutter/foundation.dart';
import 'package:shopapp/data/man.dart';
import 'package:shopapp/data/shoe_data.dart';
import 'package:shopapp/data/woman.dart';
import 'package:shopapp/model/main_shoe_model.dart';


// main manue 
class ShoeProvider with ChangeNotifier {
  List<Shoe> _localDatta = localShoes;
  List<Shoe> get localData => _localDatta;
  
}

// man shoes 
class ManShoeProvider with ChangeNotifier {
  List<ManShoe> _localman = localManShoe;
  List<ManShoe> get localManData => _localman;
  
}

// woman shoes 
class WomanShoeProvider with ChangeNotifier {
  List<WomanShoe> _localwoman = localWoman;
  List<WomanShoe> get localWomanData => _localwoman;
  
  
}
