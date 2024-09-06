import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'ing.dart';

class RecipeIngredient {
  Ing ingredient;
  double quantity;

  RecipeIngredient({required this.ingredient, required this.quantity});

  Map<String, dynamic> toJson() {
    return {
      'ingredient': ingredient.toJson(),
      'quantity': quantity,
    };
  }
}

class Recipe {
  String? id;
  String? name;
  List<RecipeIngredient> ingredients;

  Recipe({
    required this.id,
    required this.name,
    required this.ingredients,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'ingredients': ingredients.map((e) => e.toJson()).toList(),
    };
  }

  static Future<List<Recipe>> loadRecipes() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/recipes.json');

      if (!await file.exists()) {
        final baseData = jsonEncode([
          {
            "id": "1",
            "name": "Salată de fructe",
            "ingredients": [
              {
                "ingredient": {
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
                "quantity": 100.0
              },
              {
                "ingredient": {
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
                "quantity": 100.0
              },
              {
                "ingredient": {
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
                "quantity": 100.0
              }
            ]
          }
        ]);
        await file.writeAsString(baseData);
      }

      final content = await file.readAsString();
      final List<dynamic> jsonData = jsonDecode(content);

      return jsonData.map((data) {
        final List<RecipeIngredient> ingredients = (data['ingredients'] as List)
            .map((item) => RecipeIngredient(
                  ingredient: Ing(
                    id: item['ingredient']['id'],
                    name: item['ingredient']['name'],
                    calories: item['ingredient']['calories'],
                    protein: item['ingredient']['protein'],
                    carb: item['ingredient']['carb'],
                    zahar: item['ingredient']['zahar'],
                    fat: item['ingredient']['fat'],
                    satfat: item['ingredient']['satfat'],
                    sare: item['ingredient']['sare'],
                  ),
                  quantity: item['quantity'],
                ))
            .toList();

        return Recipe(
          id: data['id'],
          name: data['name'],
          ingredients: ingredients,
        );
      }).toList();
    } catch (e) {
      throw Exception('Failed to load recipes: $e');
    }
  }

  static Future<void> saveRecipe(Recipe recipe) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/recipes.json');
      final content = await file.readAsString();
      final List<dynamic> jsonData = jsonDecode(content);

      jsonData.add(recipe.toJson());

      await file.writeAsString(jsonEncode(jsonData));
    } catch (e) {
      throw Exception('Failed to save recipe: $e');
    }
  }

  static Future<void> deleteRecipe(String id) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/recipes.json');
      final content = await file.readAsString();
      final List<dynamic> jsonData = jsonDecode(content);

      jsonData.removeWhere((recipe) => recipe['id'] == id);

      await file.writeAsString(jsonEncode(jsonData));
    } catch (e) {
      throw Exception('Failed to delete recipe: $e');
    }
  }
}
