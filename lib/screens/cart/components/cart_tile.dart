import 'package:BJDelivery/commom/custom_icon_button.dart';
import 'package:BJDelivery/models/cart_product.dart';
import 'package:flutter/material.dart';

class CartTile extends StatelessWidget {
  const CartTile(this.cartProduct);

  final CartProduct cartProduct;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: <Widget>[
            SizedBox(
              height: 80,
              width: 80,
              child: Image.network(cartProduct.product.images.first),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    cartProduct.product.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 17.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      'Quantidade no estoque: ${cartProduct.product.stock}',
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  Text(
                      cartProduct.product.typeOfSale == true
                          ? 'R\$ ${cartProduct.product.price}'
                          : 'R\$ ${cartProduct.product.price}/Kg',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ))
                ],
              ),
            )),
            Column(
              children: <Widget>[
                CustomIconButton(
                  iconData: Icons.add,
                  color: Theme.of(context).primaryColor,
                  onTap: cartProduct.increment,
                ),
                Text(cartProduct.product.typeOfSale == true
                          ? '${cartProduct.quantity}'
                          : '${cartProduct.quantity}/g',
                  style: const TextStyle(fontSize: 20),
                ),
                CustomIconButton(
                  iconData: Icons.remove,
                  color: Theme.of(context).primaryColor,
                  onTap: cartProduct.decrement,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
