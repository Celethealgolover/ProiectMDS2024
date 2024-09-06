import 'package:flutter/material.dart';
import 'package:caloriesense/sidebar.dart';

class Ingredients extends StatelessWidget {
  const Ingredients({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      appBar: AppBar(
        title: const Text('Ingredientele Mele'),
        backgroundColor: Colors.blue, // Set the color of the AppBar
      ),
      backgroundColor:
          Colors.lightBlue[50], // Set the background color of the Scaffold
      body: const Center(
        child: Text('Ingredients Page', style: TextStyle(fontSize: 30)),
      ),
    );
  }
}
