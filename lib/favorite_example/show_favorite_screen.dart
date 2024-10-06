import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'favorite_provider.dart';

class ShowFavoriteScreen extends StatefulWidget {
  const ShowFavoriteScreen({super.key});

  @override
  State<ShowFavoriteScreen> createState() => _ShowFavoriteScreenState();
}

class _ShowFavoriteScreenState extends State<ShowFavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final favProvider = Provider.of<FavoriteProvider>(context);

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
              itemCount: favProvider.selectedItem.length,
              itemBuilder: (context, index) {
                final itemValue = favProvider.selectedItem[index]; // Get the actual value
                return ListTile(
                  title: Text("Item $itemValue"), // Use the value from the list
                  trailing: Icon(Icons.favorite, color: Colors.red),
                  onTap: () {
                    favProvider.removeItem(itemValue); // Remove by value, not index
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
