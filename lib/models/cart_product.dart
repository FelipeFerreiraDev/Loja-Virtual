import 'package:BJDelivery/models/product.dart';

class CartProduct {

  CartProduct.fromProduct(this.product){
    productId = product.id;
    quantity = 1;
  }

  String productId;
  int quantity;

  Product product;

}