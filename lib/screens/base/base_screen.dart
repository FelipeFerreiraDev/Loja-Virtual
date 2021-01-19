import 'package:BJDelivery/models/page_manager.dart';
import 'package:BJDelivery/models/user_manager.dart';
import 'package:BJDelivery/screens/admin_user/admin_users_screens.dart';
import 'package:BJDelivery/screens/home/home_screen.dart';
import 'package:BJDelivery/screens/products/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:BJDelivery/commom/custom_drawer/custom_drawer.dart';
import 'package:provider/provider.dart';

class BaseScreen extends StatelessWidget {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => PageManager(pageController),
      child: Consumer<UserManager>(
        builder: (_, userManager, __) {
          return PageView(
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: <Widget>[
              HomeScreen(),
              ProductsScreen(),
              Scaffold(
                  drawer: CustomDrawer(),
                  appBar: AppBar(
                    title: const Text('Home3'),
                  )),
              Scaffold(
                drawer: CustomDrawer(),
                appBar: AppBar(
                  title: const Text('Home4'),
                ),
              ),
              if (userManager.adminEnabled) ...[
                AdminUsersScreen(),
                Scaffold(
                  drawer: CustomDrawer(),
                  appBar: AppBar(
                    title: const Text('Pedidos'),
                  ),
                ),
              ]
            ],
          );
        },
      ),
    );
  }
}
