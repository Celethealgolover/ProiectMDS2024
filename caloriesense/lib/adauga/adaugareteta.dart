import 'package:flutter/material.dart';
import 'package:caloriesense/models/ing.dart';
import 'package:caloriesense/models/reteta.dart';

class AdaugaReteta extends StatefulWidget {
  const AdaugaReteta({Key? key}) : super(key: key);

  @override
  _AdaugaRetetaState createState() => _AdaugaRetetaState();
}

class _AdaugaRetetaState extends State<AdaugaReteta> {
  final _formKey = GlobalKey<FormState>();
  String? retetaName;
  List<Map<String, dynamic>> ingredienteSelectate = []; // Ingredient + gramaj
  late Future<List<Ing>> ingredienteFuture;
  Ing? ingredientSelectat;
  double? gramaj;

  @override
  void initState() {
    super.initState();
    ingredienteFuture =
        Ing.loadIngredients(); // Încarcă ingredientele existente
  }

  void adaugaIngredient() {
    if (ingredientSelectat != null && gramaj != null && gramaj! > 0) {
      setState(() {
        ingredienteSelectate.add({
          'ingredient': ingredientSelectat,
          'gramaj': gramaj,
        });
        ingredientSelectat = null;
        gramaj = null;
      });
    }
  }

  void salveazaReteta() {
    if (_formKey.currentState!.validate() && ingredienteSelectate.isNotEmpty) {
      final newRecipe = Recipe(
        id: DateTime.now().toString(),
        name: retetaName!,
        ingredients: ingredienteSelectate.map((entry) {
          final Ing ing = entry['ingredient'] as Ing;
          final double gramaj = entry['gramaj'] as double;
          return RecipeIngredient(
            ingredient: ing,
            quantity: gramaj,
          );
        }).toList(),
      );

      Recipe.saveRecipe(newRecipe).then((_) {
        Navigator.pop(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adaugă Rețetă'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nume Rețetă'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Introduceți numele rețetei';
                  }
                  return null;
                },
                onChanged: (value) => retetaName = value,
              ),
              const SizedBox(height: 20),
              FutureBuilder<List<Ing>>(
                future: ingredienteFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Eroare la încărcarea ingredientelor');
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Text('Niciun ingredient disponibil');
                  } else {
                    final List<Ing> ingrediente = snapshot.data!;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DropdownButtonFormField<Ing>(
                          decoration: const InputDecoration(
                              labelText: 'Alege Ingredient'),
                          value: ingredientSelectat,
                          items: ingrediente.map((ing) {
                            return DropdownMenuItem<Ing>(
                              value: ing,
                              child: Text(ing.name!),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              ingredientSelectat = value;
                            });
                          },
                        ),
                        TextFormField(
                          decoration:
                              const InputDecoration(labelText: 'Gramaj (g)'),
                          keyboardType: TextInputType.number,
                          onChanged: (value) => gramaj = double.tryParse(value),
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                double.tryParse(value) == null) {
                              return 'Introduceți un gramaj valid';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: adaugaIngredient,
                          child: const Text('Adaugă Ingredient'),
                        ),
                        const SizedBox(height: 20),
                        const Text('Ingrediente Selectate:'),
                        for (var entry in ingredienteSelectate)
                          Text(
                              '${entry['ingredient'].name} - ${entry['gramaj']}g'),
                      ],
                    );
                  }
                },
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: () {
                      // Navighează înapoi fără a salva
                      Navigator.pop(context);
                    },
                    child: const Text('Iesire'),
                  ),
                  ElevatedButton(
                    onPressed: salveazaReteta,
                    child: const Text('Salvează Rețeta'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
