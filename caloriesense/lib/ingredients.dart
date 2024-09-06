import 'package:caloriesense/sidebar.dart';
import 'package:caloriesense/ingredient1.dart';
import 'package:caloriesense/models/ing.dart';
import 'package:caloriesense/adauga/adaugaig.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';
import 'dart:io';

class Ingredients extends StatefulWidget {
  @override
  State<Ingredients> createState() => _IngredientsState();
}

class _IngredientsState extends State<Ingredients> {
  late Future<List<Ing>> ingredienteFuture;

  @override
  void initState() {
    super.initState();
    ingredienteFuture =
        Ing.loadIngredients(); // Asigură-te că inițializezi aici
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      appBar: AppBar(
        title: const Text('Ingredientele Mele'),
        backgroundColor: Colors.lightBlue,
      ),
      backgroundColor: const Color.fromARGB(255, 231, 233, 235),
      body: FutureBuilder<List<Ing>>(
        future: ingredienteFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Eroare: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Niciun ingredient găsit.'));
          } else {
            final List<Ing> ingrediente = snapshot.data!;
            return Stack(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 35),
                  child: Column(
                    children: [
                      SizedBox(height: 15),
                      searchBox(),
                      Expanded(
                        child: ListView(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 30, bottom: 20),
                            ),
                            for (Ing ing in ingrediente) Ingredient1(ing: ing),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    child: FloatingActionButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const AdaugaIng()),
                         );
                      },
                      child: const Icon(Icons.add, color: Colors.white),
                      backgroundColor: const Color.fromARGB(255, 174, 61, 194),
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

Widget searchBox() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(30)),
    child: Row(
      children: [
        Expanded(
            child: TextField(
          decoration: InputDecoration(
              hintText: "Cauta ingredientele",
              hintStyle: TextStyle(color: Colors.black54),
              border: InputBorder.none),
        )),
        Icon(
          Icons.search,
          color: Colors.black54,
        )
      ],
    ),
  );
}
