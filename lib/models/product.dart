import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  Product.fromDocument(DocumentSnapshot document) {
    id = document.documentID;
    name = document['name'] as String;
    description = document['description'] as String;
    images = List<String>.from(document.data['images'] as List<dynamic>);
    price = document['price'] as num;
    stock = document['stock'] as int;
  }

  String id;
  String name;
  String description;
  List<String> images;
  num price;
  int stock;
}
