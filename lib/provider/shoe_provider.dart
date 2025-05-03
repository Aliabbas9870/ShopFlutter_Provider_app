
import 'package:flutter/foundation.dart';
import 'package:shopapp/data/all_data.dart';
import 'package:shopapp/model/main_shoe_model.dart';

class ShoeProvider with ChangeNotifier {
  // Shoe data for each category
  final List<Shoe> localManShoe = manShoe;
  final List<Shoe> localShoe = localShoes;
  final List<Shoe> localWomanShoe = womanShoe;
  final List<Shoe> localkidShoe = kidShoe;

  // Combine all shoe data into one list
  final List<Shoe> _allShoes = [
    ...localShoes,
    ...manShoe,
    ...womanShoe,
    ...kidShoe,
  ];

  // Getter to access all shoes
  List<Shoe> get allShoes => _allShoes;

  // Getter for kid shoes
  List<Shoe> get localData => localShoe;
  List<Shoe> get localDat => localData;

  // Getter for man shoes
  List<Shoe> get localManData => localManShoe;

  // Getter for woman shoes
  List<Shoe> get localWomanData => localWomanShoe;

  // Method to get shoes by category
  List<Shoe> getShoesByCategory(String category) =>
      _allShoes.where((shoe) => shoe.category.toLowerCase() == category.toLowerCase()).toList();
}
