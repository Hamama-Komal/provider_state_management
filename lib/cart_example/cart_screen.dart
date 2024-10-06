import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state/cart_example/cart_provider.dart';

import 'constants.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _buildUI(),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      title: const Text("My Cart"),
    );
  }
  Widget _buildUI() {
    return Consumer<CartProvider>(
      builder: (context, provider, _) {
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: provider.items.length,
                itemBuilder: (context, index) {
                  Product product = provider.items[index];
                  return ListTile(
                    title: Text(product.name),
                    onLongPress: (){
                      provider.remove(product);
                    },
                  );
                },
              ),
            ),
            Text("Cart Total: \$${provider.getCartTotal()}")
          ],
        ); },
    );
  }
}
