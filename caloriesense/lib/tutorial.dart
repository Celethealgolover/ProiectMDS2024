import 'package:flutter/material.dart';
import 'package:caloriesense/sidebar.dart';

class Tutorial extends StatelessWidget {
  const Tutorial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      appBar: AppBar(
        title: const Text('Tutorial'),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.lightBlue[50],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TutorialSection(
              title: 'Cum creezi un ingredient nou',
              content:
                  '1. Navighează la pagina "Adaugă Ingredient" din meniul principal.\n'
                  '2. Introdu numele ingredientului în câmpul corespunzător.\n'
                  '3. Completează valorile nutriționale pentru ingredient (calorii, proteine, carbohidrați, grăsimi, zaharuri, grăsimi saturate, și sare).\n'
                  '4. Apasă pe butonul "Salvează Ingredientul" pentru a-l adăuga în baza de date.\n'
                  'Ingredientul va fi acum disponibil în lista de ingrediente atunci când creezi sau modifici o rețetă.\n'
                  'Valorile nutritionale introduse trebuie sa fie per suta de grame a produsului alimentar!',
            ),
            const SizedBox(height: 20),
            TutorialSection(
              title: 'Cum adaugi o rețetă',
              content:
                  '1. Navighează la pagina "Adaugă Rețetă" din meniul principal.\n'
                  '2. Introdu numele rețetei în câmpul corespunzător.\n'
                  '3. Adaugă ingredientele rețetei folosind pașii din secțiunea ulterioara.\n'
                  '4. După ce ai adăugat toate ingredientele, apasă pe butonul "Salvează Rețeta" pentru a finaliza operațiunea.',
            ),
            const SizedBox(height: 20),
            TutorialSection(
              title: 'Cum adaugi un ingredient la o rețetă',
              content: '1. Navighează la pagina "Adaugă Rețetă".\n'
                  '2. În formularul de adăugare a rețetei, vei găsi o listă derulantă cu ingredientele disponibile.\n'
                  '3. Selectează ingredientul nou creat sau un alt ingredient din listă.\n'
                  '4. Introdu gramajul ingredientului în câmpul specificat.\n'
                  '5. Apasă pe butonul "Adaugă Ingredient" pentru a-l include în rețetă.',
            ),
            const SizedBox(height: 20),
            TutorialSection(
              title: 'Unde se face calculul valorilor nutriționale',
              content:
                  'Calculul valorilor nutriționale se face automat pe baza ingredientelor adăugate la rețetă.\n'
                  'După ce adaugi toate ingredientele, aplicația calculează valorile pentru întreaga rețetă și pentru 100g.\n'
                  'Poți vizualiza aceste valori pe pagina de detalii a rețetei, după ce ai salvat-o.',
            ),
          ],
        ),
      ),
    );
  }
}

class TutorialSection extends StatelessWidget {
  final String title;
  final String content;

  const TutorialSection({
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              content,
              style: const TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}
