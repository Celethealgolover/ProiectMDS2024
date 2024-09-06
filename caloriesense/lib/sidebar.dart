import 'package:flutter/material.dart';
import 'package:caloriesense/ingredients.dart';
import 'package:caloriesense/retete.dart';
import 'package:caloriesense/tutorial.dart';
import 'package:caloriesense/setari.dart';
import 'package:caloriesense/main.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text("accountName"),
            accountEmail: Text("accountEmail"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                "A",
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Acasa'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyApp()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.food_bank),
            title: const Text('Ingredientele Mele'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Ingredients()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.book),
            title: const Text('Retete Mele'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Retete()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.question_mark),
            title: const Text('Cum folosesc aplicatia'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Tutorial()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Setari'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Setari()),
              );
            },
          ),
        ],
      ),
    );
  }
}
