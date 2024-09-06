import 'package:flutter/material.dart';
import 'package:caloriesense/sidebar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navigation Drawer App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        drawer: const Sidebar(),
        appBar: AppBar(
          title: const Text('Calculator Valori Nutritionale'),
          backgroundColor: Colors.blue, // Set the color of the AppBar
        ),
        backgroundColor:
            Colors.lightBlue[50], // Set the background color of the Scaffold
        body: const Center(
          child: Text('Main Page', style: TextStyle(fontSize: 30)),
        ),
      ),
    );
  }
}
