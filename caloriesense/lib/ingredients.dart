import 'package:flutter/material.dart';
import 'package:caloriesense/sidebar.dart';
import 'package:caloriesense/ingredient1.dart';
import 'package:caloriesense/models/ing.dart';

class Ingredients extends StatelessWidget {
  Ingredients({Key? key}) : super(key: key);

  final baza = Ing.baza();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      appBar: AppBar(
        title: const Text('Ingredientele Mele'),
        backgroundColor: Colors.lightBlue,
      ),
      backgroundColor: const Color.fromARGB(255, 231, 233, 235),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 35),
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              searchBox(),
              Expanded(
                  child: ListView(children: [
                Container(
                  margin: EdgeInsets.only(top: 30, bottom: 20),
                ),
                for (Ing ing in baza) Ingredient1(ing: ing)
              ]))
            ],
          )),
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
