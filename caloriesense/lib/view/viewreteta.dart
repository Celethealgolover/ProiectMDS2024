import 'package:flutter/material.dart';
import 'package:caloriesense/models/reteta.dart';

class ViewReteta extends StatelessWidget {
  final Recipe reteta;

  ViewReteta({required this.reteta});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(reteta.name ?? 'Detalii Rețetă'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              Recipe.deleteRecipe(reteta.id!).then((_) {
                Navigator.pop(context);
              }).catchError((e) {
                print('Eroare la ștergerea rețetei: $e');
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Ingrediente:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: reteta.ingredients.length,
                itemBuilder: (context, index) {
                  final ingredient = reteta.ingredients[index];
                  return ListTile(
                    title: Text(ingredient.ingredient.name ?? 'Necunoscut'),
                    subtitle: Text('Gramaj: ${ingredient.quantity} g'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
