import 'package:BJDelivery/models/product.dart';
import 'package:BJDelivery/models/user_manager.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController valueController = TextEditingController();

  final userLogin = UserManager().isLoggedIn;

  ProductScreen(this.product);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: product,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(product.name),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            SizedBox(
              width: 150,
              height: 300,
              child: AspectRatio(
                aspectRatio: 1,
                child: Carousel(
                  boxFit: BoxFit.contain,
                  images: product.images.map((url) {
                    return NetworkImage(url);
                  }).toList(),
                  dotSize: 4,
                  dotSpacing: 15,
                  dotBgColor: Colors.transparent,
                  dotColor: Theme.of(context).primaryColor,
                  autoplay: false,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    product.name,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      'A partir de',
                      style: TextStyle(color: Colors.grey[600], fontSize: 13),
                    ),
                  ),
                  Text(
                    product.typeOfSale == true
                        ? 'R\$ ${product.price.toString()}'
                        : 'R\$ ${product.price.toString()} /kg',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 16, bottom: 8),
                    child: Text(
                      'Descrição',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Text(
                    product.description,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 16, bottom: 8),
                    child: Text(
                      'Quantidades no estoque',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                    ),
                  ),
                  Text(
                    product.typeOfSale == true && product.stock >= 0
                        ? product.stock.toString()
                        : '${product.weigth.toString()} /g',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: product.stock > 0
                          ? Theme.of(context).primaryColor
                          : Colors.red,
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: TextFormField(
                      controller: valueController,
                      decoration: InputDecoration(
                          hintText: product.typeOfSale == true
                              ? 'Unidade'
                              : 'Peso em gramas'),
                      keyboardType: TextInputType.number,
                      autocorrect: false,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Consumer<UserManager>(
                    builder: (_, userManager, __) {
                      return SizedBox(
                        height: 44,
                        child: RaisedButton(
                          onPressed: () {
                            final valor = int.parse(valueController.text);
                            if (userManager.isLoggedIn) {}
                            if (userManager.isLoggedIn == false) {
                              Navigator.of(context).pushNamed('/login');
                            } else if (valor > product.stock || valor < 0) {
                              return showAlertDialog1(context);
                            } else if (valueController.text == '' ||
                                valueController.text == ' ' ||
                                valueController.text == null ||
                                valueController.text.isEmpty == true ||
                                valueController.value.text.isEmpty) {
                              return showAlertDialog1(context);
                            } else {
                              print(valor);
                            }
                          },
                          color: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                          child: Text(
                            userManager.isLoggedIn
                                ? 'Adicionar ao carrinho'
                                : 'Entre para comprar',
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

showAlertDialog1(BuildContext context) {
  // configura o button
  final Widget okButton = FlatButton(
    child: const Text("OK"),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  // configura o  AlertDialog
  final AlertDialog alerta = AlertDialog(
    title: const Text("Valor digitado inválido"),
    content: const Text("Digite uma quantidade existente no estoque"),
    actions: [
      okButton,
    ],
  );
  // exibe o dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alerta;
    },
  );
}
