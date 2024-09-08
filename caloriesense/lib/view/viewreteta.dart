import 'package:flutter/material.dart';
import 'package:caloriesense/models/reteta.dart';
import 'package:caloriesense/retete.dart';

class ViewReteta extends StatelessWidget {
  final Recipe reteta;

  ViewReteta({required this.reteta});

  @override
  Widget build(BuildContext context) {
    final totalGramaj = reteta.ingredients.fold(
      0.0,
      (sum, ingredient) => sum + ingredient.quantity,
    );

    final totalCalories = reteta.ingredients.fold(
      0.0,
      (sum, ingredient) =>
          sum +
          (ingredient.ingredient.calories ?? 0) * (ingredient.quantity / 100),
    );

    final totalProteins = reteta.ingredients.fold(
      0.0,
      (sum, ingredient) =>
          sum +
          (ingredient.ingredient.protein ?? 0) * (ingredient.quantity / 100),
    );

    final totalCarbs = reteta.ingredients.fold(
      0.0,
      (sum, ingredient) =>
          sum + (ingredient.ingredient.carb ?? 0) * (ingredient.quantity / 100),
    );

    final totalSugar = reteta.ingredients.fold(
      0.0,
      (sum, ingredient) =>
          sum +
          (ingredient.ingredient.zahar ?? 0) * (ingredient.quantity / 100),
    );

    final totalFat = reteta.ingredients.fold(
      0.0,
      (sum, ingredient) =>
          sum + (ingredient.ingredient.fat ?? 0) * (ingredient.quantity / 100),
    );

    final totalSatFat = reteta.ingredients.fold(
      0.0,
      (sum, ingredient) =>
          sum +
          (ingredient.ingredient.satfat ?? 0) * (ingredient.quantity / 100),
    );

    final totalSalt = reteta.ingredients.fold(
      0.0,
      (sum, ingredient) =>
          sum + (ingredient.ingredient.sare ?? 0) * (ingredient.quantity / 100),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(reteta.name ?? 'Detalii Rețetă'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Informații Generale:',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildNutritionalInfo(
              totalGramaj,
              totalCalories,
              totalProteins,
              totalCarbs,
              totalSugar,
              totalFat,
              totalSatFat,
              totalSalt,
            ),
            SizedBox(height: 20),
            Text(
              'Ingrediente:',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: reteta.ingredients.length,
                itemBuilder: (context, index) {
                  final ingredient = reteta.ingredients[index];
                  return Card(
                    elevation: 3,
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      title: Text(
                        ingredient.ingredient.name ?? 'Necunoscut',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text('Gramaj: ${ingredient.quantity} g'),
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Înapoi',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                    onPressed: () {
                      Recipe.deleteRecipe(reteta.id!).then((_) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Retete()),
                        );
                      }).catchError((e) {
                        print('Eroare la ștergerea rețetei: $e');
                      });
                    },
                    child: Text(
                      'Șterge',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNutritionalInfo(
    double totalGramaj,
    double totalCalories,
    double totalProteins,
    double totalCarbs,
    double totalSugar,
    double totalFat,
    double totalSatFat,
    double totalSalt,
  ) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoRow(
                'Gramaj Total:', '${totalGramaj.toStringAsFixed(2)} g'),
            SizedBox(height: 10),
            _buildInfoRow('VALORI NUTRITIONALE PER 100G:', ' '),
            _buildInfoRow('Calorii:',
                '${(totalCalories / totalGramaj * 100).toStringAsFixed(2)} kcal'),
            _buildInfoRow('KJ:',
                '${(totalCalories * 4.184 / totalGramaj * 100).toStringAsFixed(2)} kJ'),
            _buildInfoRow('Proteine:',
                '${(totalProteins / totalGramaj * 100).toStringAsFixed(2)} g'),
            _buildInfoRow('Carbohidrați:',
                '${(totalCarbs / totalGramaj * 100).toStringAsFixed(2)} g'),
            _buildInfoRow('Zaharuri:',
                '${(totalSugar / totalGramaj * 100).toStringAsFixed(2)} g'),
            _buildInfoRow('Grăsimi:',
                '${(totalFat / totalGramaj * 100).toStringAsFixed(2)} g'),
            _buildInfoRow('Grăsimi Saturate:',
                '${(totalSatFat / totalGramaj * 100).toStringAsFixed(2)} g'),
            _buildInfoRow('Sare:',
                '${(totalSalt / totalGramaj * 100).toStringAsFixed(2)} g'),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        Text(
          value,
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
