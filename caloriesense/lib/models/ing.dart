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

  static List<Ing> baza() {
    return [
      Ing(
        id: '1',
        name: 'Banana',
        calories: 89.0,
        protein: 1.1,
        carb: 22.8,
        zahar: 12.2,
        fat: 0.3,
        satfat: 0.1,
        sare: 0.0,
      ),
      Ing(
        id: '2',
        name: 'Apple',
        calories: 52.0,
        protein: 0.3,
        carb: 13.8,
        zahar: 10.4,
        fat: 0.2,
        satfat: 0.0,
        sare: 0.0,
      ),
      Ing(
        id: '3',
        name: 'Orange',
        calories: 47.0,
        protein: 1.0,
        carb: 11.8,
        zahar: 9.4,
        fat: 0.2,
        satfat: 0.0,
        sare: 0.0,
      ),
    ];
  }
}
