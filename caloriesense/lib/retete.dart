import 'package:flutter/material.dart';
import 'package:caloriesense/sidebar.dart';

class Retete extends StatelessWidget {
  const Retete({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      appBar: AppBar(
        title: const Text('Retetele Mele'),
        backgroundColor: Colors.blue, // Set the color of the AppBar
      ),
      backgroundColor:
          Colors.lightBlue[50], // Set the background color of the Scaffold
      body: const Center(
        child: Text('Retete Page', style: TextStyle(fontSize: 30)),
      ),
    );
  }
}
