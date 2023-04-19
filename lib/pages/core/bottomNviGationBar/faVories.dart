import 'package:flutter/material.dart';

class FavoritesUI extends StatefulWidget {
  @override
  _FavoritesUIState createState() => _FavoritesUIState();
}

class _FavoritesUIState extends State<FavoritesUI> {
  List<String> _favorites = ['Favorite 1', 'Favorite 2', 'Favorite 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: ListView.builder(
        itemCount: _favorites.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(_favorites[index]),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  _favorites.removeAt(index);
                });
              },
            ),
          );
        },
      ),
    );
  }
}


