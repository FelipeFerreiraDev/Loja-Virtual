import 'package:BJDelivery/models/product.dart';
import 'package:flutter/material.dart';

class CartProduct extends ChangeNotifier{
  //final Map arguments = ModalRoute.of(context).settings.arguments as Map;

  CartProduct.fromProduct(this.product) {
    productId = product.id;
    //quantity = int.parse(arguments['quantidade']);
  }

  String productId;
  int quantity;

  Product product;
}
