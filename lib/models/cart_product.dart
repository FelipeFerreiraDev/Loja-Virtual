import 'package:BJDelivery/models/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CartProduct extends ChangeNotifier {

  CartProduct.fromProduct(this.product) {
    productId = product.id;
    quantity = 1;
  }

  CartProduct.fromDocument(DocumentSnapshot document) {
    productId = document.data['pid'] as String;
    quantity = document.data['quantity'] as int;

    firestore
        .document('products/$productId')
        .get()
        .then((doc) => product = Product.fromDocument(doc));
  }

  final Firestore firestore = Firestore.instance;

  String productId;
  int quantity;

  Product product;

  Map<String, dynamic> toCartItemMap() {
    return {
      'pid': productId,
      'quantity': quantity,
    };
  }
}
