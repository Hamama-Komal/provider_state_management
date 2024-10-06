import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state/cart_example/cart_provider.dart';

import 'constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _buildUI(context),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      title: const Text("Products"),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, "/cart");
          },
          icon: const Icon(Icons.shopping_cart),
        ),
      ],
    );
  }

  Widget _buildUI(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    return ListView.builder(
      itemCount: PRODUCTS.length,
      itemBuilder: (context, index) {
        Product product = PRODUCTS[index];
        return ListTile(
          leading: Container(
              height: 30,
              width: 30,
              child: CircleAvatar(
                backgroundColor: product.color,
              )),
          title: Text(product.name),
          trailing: Checkbox(
            value: cartProvider.items.contains(product),
            onChanged: (value) {
              if (value == true) {
                cartProvider.add(product);
              } else {
                cartProvider.remove(product);
              }
            },
          ),
        );
      },
    );
  }
}
