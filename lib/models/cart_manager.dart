import 'package:BJDelivery/models/cart_product.dart';
import 'package:BJDelivery/models/product.dart';
import 'package:BJDelivery/models/user.dart';
import 'package:BJDelivery/models/user_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CartManager {
  List<CartProduct> items = [];

  User user;

  void updateUser(UserManager userManager){
    user = userManager.user;
    items.clear();

    if(user != null) {
      _loadCartItems();
    }
  }

  Future<void> _loadCartItems() async{
    final QuerySnapshot cartSnap = await user.cartReference.getDocuments();
  
    items = cartSnap.documents.map((d) => CartProduct.fromDocument(d)).toList();
  }

  void addToCart(Product product) {
    final cartProduct = CartProduct.fromProduct(product);
    items.add(CartProduct.fromProduct(product));
    user.cartReference.add(cartProduct.toCartItemMap());

  }
}
