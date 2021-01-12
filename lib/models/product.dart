import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Product extends ChangeNotifier{
  Product.fromDocument(DocumentSnapshot document) {
    id = document.documentID;
    name = document['name'] as String;
    description = document['description'] as String;
    images = List<String>.from(document.data['images'] as List<dynamic>);
    price = document['price'] as num;
    stock = document['stock'] as int;
    typeOfSale = document['typeOfSale'] as bool;
    //weigth = document['weigth'] as num;
  }

  String id;
  String name;
  String description;
  List<String> images;
  num price;
  int stock;
  bool typeOfSale; //verdadeiro para quantidade e falso para peso
  //num weigth;

/*  int _selectedStock;
  int get selectedStock => _selectedStock;
  set selectedStock(int value) {
    _selectedStock = value;
    print(value);
    notifyListeners();
  }*/
}
