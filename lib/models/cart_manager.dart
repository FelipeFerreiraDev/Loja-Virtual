import 'package:BJDelivery/models/cart_product.dart';
import 'package:BJDelivery/models/product.dart';

class CartManager {
  List<CartProduct> items = [];

  void addToCart(Product product) {
    items.add(CartProduct.fromProduct(product));
  }
}
