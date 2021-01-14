import 'package:BJDelivery/models/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CartProduct extends ChangeNotifier {
  CartProduct.fromProduct(this.product) {
    productId = product.id;
    quantity = product.typeOfSale == true ? 1 : 25;
  }

  CartProduct.fromDocument(DocumentSnapshot document) {
    id = document.documentID;
    productId = document.data['pid'] as String;
    quantity = document.data['quantity'] as int;

    firestore
        .document('products/$productId')
        .get()
        .then((doc) => product = Product.fromDocument(doc));
  }

  final Firestore firestore = Firestore.instance;

  String id;

  String productId;
  int quantity;

  Product product;

  num get unitPrice {
    if (product == null) return 0;
    return product.price ?? 0;
  }

  num get totalPrice => product.typeOfSale == true
      ? quantity * product.price
      : (quantity / 1000) * product.price;

  Map<String, dynamic> toCartItemMap() {
    return {
      'pid': productId,
      'quantity': quantity,
    };
  }

  bool stackable(Product product) {
    return product.id == productId;
  }

  void increment() {
    if (product.typeOfSale == false) {
      quantity += 25;
      notifyListeners();
    } else {
      quantity++;
      notifyListeners();
    }
  }

  void decrement() {
    if (product.typeOfSale == false) {
      quantity -= 25;
      notifyListeners();
    } else {
      quantity--;
      notifyListeners();
    }
  }

  bool get hasStock {
    return product.stock >= quantity;
  }
}
