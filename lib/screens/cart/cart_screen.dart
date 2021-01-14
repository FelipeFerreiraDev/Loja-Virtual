import 'package:BJDelivery/commom/price_card.dart';
import 'package:BJDelivery/models/cart_manager.dart';
import 'package:BJDelivery/screens/cart/components/cart_tile.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho'),
        centerTitle: true,
      ),
      body: Consumer<CartManager>(builder: (_, cartManager, __) {
        return ListView(children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: cartManager.items
                .map((cartProduct) => CartTile(cartProduct))
                .toList(),
          ),
          PriceCard(buttonText: 'Continuar para Entrega',onPressed: cartManager.isCartValid ? () {

          } : null ,),
        ]);
      }),
    );
  }
}
