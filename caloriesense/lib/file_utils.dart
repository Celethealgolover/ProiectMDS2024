import 'dart:convert';
import 'dart:io'; // Pentru operațiuni cu fișiere
import 'package:path_provider/path_provider.dart'; // Pentru găsirea directorului

Future<void> ensureIngredientsFileExists() async {
  final directory = await getApplicationDocumentsDirectory();
  final filePath = '${directory.path}/ingredients.json';
  final file = File(filePath);

  // Verifică dacă fișierul există
  if (!await file.exists()) {
    // Dacă nu există, creează-l cu date implicite
    final List<Map<String, dynamic>> defaultIngredients = [
      {
        "id": "1",
        "name": "Banana",
        "calories": 89.0,
        "protein": 1.1,
        "carb": 22.8,
        "zahar": 12.2,
        "fat": 0.3,
        "satfat": 0.1,
        "sare": 0.0
      },
      {
        "id": "2",
        "name": "Apple",
        "calories": 52.0,
        "protein": 0.3,
        "carb": 13.8,
        "zahar": 10.4,
        "fat": 0.2,
        "satfat": 0.0,
        "sare": 0.0
      },
      {
        "id": "3",
        "name": "Orange",
        "calories": 47.0,
        "protein": 1.0,
        "carb": 11.8,
        "zahar": 9.4,
        "fat": 0.2,
        "satfat": 0.0,
        "sare": 0.0
      },
      {
        "id": "4",
        "name": "Orange",
        "calories": 47.0,
        "protein": 1.0,
        "carb": 11.8,
        "zahar": 9.4,
        "fat": 0.2,
        "satfat": 0.0,
        "sare": 0.0
      }
    ];

    await file.writeAsString(jsonEncode(defaultIngredients));
  }
}
