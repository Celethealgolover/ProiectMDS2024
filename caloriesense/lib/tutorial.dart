import 'package:flutter/material.dart';
import 'package:caloriesense/sidebar.dart';

class Tutorial extends StatelessWidget {
  const Tutorial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      appBar: AppBar(
        title: const Text('Tutorial'),
        backgroundColor: Colors.blue, // Set the color of the AppBar
      ),
      backgroundColor:
          Colors.lightBlue[50], // Set the background color of the Scaffold
      body: const Center(
        child: Text('Tutorial Page', style: TextStyle(fontSize: 30)),
      ),
    );
  }
}
