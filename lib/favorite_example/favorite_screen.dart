import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'favorite_provider.dart';
import 'show_favorite_screen.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite"),
        actions: [
          InkWell(
            child: const Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ShowFavoriteScreen()));
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 30,
              itemBuilder: (context, index) {
                return Consumer<FavoriteProvider>(
                  builder: (context, value, child) {
                    final isFavorite = value.selectedItem.contains(index);
                    return ListTile(
                      title: Text("Item $index"),
                      trailing: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_outline,
                        color: isFavorite ? Colors.red : Colors.black,
                      ),
                      onTap: () {
                        if (isFavorite) {
                          value.removeItem(index);
                        } else {
                          value.addItem(index);
                        }
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
