import 'package:flutter/material.dart';
import 'package:caloriesense/sidebar.dart'; // Import pentru Retete Recomandate
import 'package:caloriesense/adauga/adaugareteta.dart'; // Import pentru Adaugare Reteta
import 'package:caloriesense/tutorial.dart'; // Import pentru Tutorial
import 'package:caloriesense/adauga/adaugaig.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator Valori Nutritionale',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        drawer: const Sidebar(),
        appBar: AppBar(
          title: const Text('Calculator Valori Nutritionale'),
          backgroundColor: Colors.blue,
        ),
        backgroundColor: Colors.lightBlue[50],
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Bine ai venit la Calculatorul de Valori Nutriționale!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const Text(
                'Selectează o opțiune din cele de mai jos pentru a începe:',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                icon: const Icon(Icons.add),
                label: const Text('Adaugă o Rețetă Nouă'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AdaugaReteta(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  backgroundColor: const Color.fromARGB(255, 31, 212, 143),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                icon: const Icon(Icons.add),
                label: const Text('Adaugă un Ingredient Nou'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AdaugaIng(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  backgroundColor: const Color.fromARGB(255, 191, 114, 214),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                icon: const Icon(Icons.help_outline),
                label: const Text('Vezi Tutorial'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Tutorial(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  backgroundColor: Colors.orangeAccent,
                ),
              ),
              const Spacer(),
              const Center(
                child: Text(
                  'Aplicație pentru gestionarea valorilor nutriționale',
                  style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
