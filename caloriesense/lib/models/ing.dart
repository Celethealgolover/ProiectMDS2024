import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class Ing {
  String? id;
  String? name;
  double? calories;
  double? protein;
  double? carb;
  double? zahar;
  double? fat;
  double? satfat;
  double? sare;

  Ing({
    required this.id,
    required this.name,
    required this.calories,
    required this.protein,
    required this.carb,
    required this.zahar,
    required this.fat,
    required this.satfat,
    required this.sare,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'calories': calories,
      'protein': protein,
      'carb': carb,
      'zahar': zahar,
      'fat': fat,
      'satfat': satfat,
      'sare': sare,
    };
  }

  static Future<List<Ing>> loadIngredients() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/ingredients.json');

      if (!await file.exists()) {
        final baseData = jsonEncode([
          {
            "id": "1",
            "name": "Apa",
            "calories": 0.0,
            "protein": 0.0,
            "carb": 0.0,
            "zahar": 0.0,
            "fat": 0.0,
            "satfat": 0.0,
            "sare": 0.0,
          },
        ]);
        await file.writeAsString(baseData);
      }

      final content = await file.readAsString();
      final List<dynamic> jsonData = jsonDecode(content);

      return jsonData
          .map((data) => Ing(
                id: data['id'],
                name: data['name'],
                calories: data['calories'],
                protein: data['protein'],
                carb: data['carb'],
                zahar: data['zahar'],
                fat: data['fat'],
                satfat: data['satfat'],
                sare: data['sare'],
              ))
          .toList();
    } catch (e) {
      throw Exception('Failed to load ingredients: $e');
    }
  }

  static Future<void> deleteIngredient(String id) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/ingredients.json');
      final content = await file.readAsString();
      final List<dynamic> jsonData = jsonDecode(content);

      jsonData.removeWhere((item) => item['id'] == id);

      await file.writeAsString(jsonEncode(jsonData));
    } catch (e) {
      throw Exception('Eroare: $e');
    }
  }
}
