import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:caloriesense/models/ing.dart';
import 'package:caloriesense/ingredients.dart';

class AdaugaIng extends StatefulWidget {
  const AdaugaIng({Key? key}) : super(key: key);

  @override
  State<AdaugaIng> createState() => _AdaugaIngState();
}

class _AdaugaIngState extends State<AdaugaIng> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _caloriesController = TextEditingController();
  final TextEditingController _proteinsController = TextEditingController();
  final TextEditingController _carbsController = TextEditingController();
  final TextEditingController _zaharController = TextEditingController();
  final TextEditingController _fatController = TextEditingController();
  final TextEditingController _satfatController = TextEditingController();
  final TextEditingController _sareController = TextEditingController();

  Future<void> _addIngredient() async {
    final double? calories = double.tryParse(_caloriesController.text);
    final double? protein = double.tryParse(_proteinsController.text);
    final double? carb = double.tryParse(_carbsController.text);
    final double? zahar = double.tryParse(_zaharController.text);
    final double? fat = double.tryParse(_fatController.text);
    final double? satfat = double.tryParse(_satfatController.text);
    final double? sare = double.tryParse(_sareController.text);

    if (calories != null &&
        protein != null &&
        carb != null &&
        zahar != null &&
        fat != null &&
        satfat != null &&
        sare != null) {
      final newIngredient = Ing(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: _nameController.text,
        calories: calories,
        protein: protein,
        carb: carb,
        zahar: zahar,
        fat: fat,
        satfat: satfat,
        sare: sare,
      );

      await _saveIngredient(newIngredient);

      Navigator.pop(context);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Ingredients()),
      );
    } else {
      print("Eroare.");
    }
  }

  static Future<void> deleteIngredient(String id) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/ingredients.json');

      if (!await file.exists()) {
        throw Exception('Ingredientul nu exista.');
      }


      final content = await file.readAsString();
      final List<dynamic> jsonData = jsonDecode(content);


      final updatedData = jsonData.where((item) => item['id'] != id).toList();


      final updatedContent = jsonEncode(updatedData);
      await file.writeAsString(updatedContent);
    } catch (e) {
      throw Exception('Eroare: $e');
    }
  }

  Future<void> _saveIngredient(Ing ingredient) async {
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/ingredients.json';

    final file = File(path);
    List<dynamic> ingredientsList = [];

    if (await file.exists()) {
      final contents = await file.readAsString();
      ingredientsList = jsonDecode(contents);
    }

    ingredientsList.add(ingredient.toJson());
    await file.writeAsString(jsonEncode(ingredientsList));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Adauga Ingredient')),
        backgroundColor: Colors.lightBlue,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Denumire Ingredient',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _caloriesController,
                  decoration: InputDecoration(
                    labelText: 'Calorii',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _proteinsController,
                  decoration: InputDecoration(
                    labelText: 'Proteine',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _carbsController,
                  decoration: InputDecoration(
                    labelText: 'Carbohidrați',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _zaharController,
                  decoration: InputDecoration(
                    labelText: 'Zaharuri',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _fatController,
                  decoration: InputDecoration(
                    labelText: 'Grăsimi',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _satfatController,
                  decoration: InputDecoration(
                    labelText: 'Grăsimi Saturate',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _sareController,
                  decoration: InputDecoration(
                    labelText: 'Sare',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: _addIngredient,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  backgroundColor: Colors.purple,
                ),
                child: const Text(
                  'Adaugă Ingredient',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(home: AdaugaIng()));
}
