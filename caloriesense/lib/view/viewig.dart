import 'package:flutter/material.dart';
import 'package:caloriesense/models/ing.dart';

class ViewIg extends StatelessWidget {
  final Ing ingredient;

  const ViewIg({Key? key, required this.ingredient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Calculează KJ din calorii
    final double caloriesInKJ = (ingredient.calories ?? 0) * 4.184;

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Detalii Ingredient',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Denumire: ${ingredient.name ?? 'N/A'}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Calorii: ${ingredient.calories ?? 0} kcal',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'KJ: ${caloriesInKJ.toStringAsFixed(2)} kJ', // Afișează valoarea KJ
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Proteine: ${ingredient.protein ?? 0} g',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Carbohidrați: ${ingredient.carb ?? 0} g',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Zaharuri: ${ingredient.zahar ?? 0} g',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Grăsimi: ${ingredient.fat ?? 0} g',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Grăsimi Saturate: ${ingredient.satfat ?? 0} g',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Sare: ${ingredient.sare ?? 0} g',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
