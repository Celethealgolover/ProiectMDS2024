import 'package:flutter/material.dart';
import 'package:caloriesense/sidebar.dart';
import 'package:caloriesense/models/reteta.dart';
import 'package:caloriesense/adauga/adaugareteta.dart';
import 'package:caloriesense/view/viewreteta.dart';

class Retete extends StatefulWidget {
  const Retete({Key? key}) : super(key: key);

  @override
  State<Retete> createState() => _ReteteState();
}

class _ReteteState extends State<Retete> {
  late Future<List<Recipe>> reteteFuture;

  @override
  void initState() {
    super.initState();
    reteteFuture = Recipe.loadRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      appBar: AppBar(
        title: const Text('Rețetele Mele'),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: const Color.fromARGB(255, 231, 233, 235),
      body: FutureBuilder<List<Recipe>>(
        future: reteteFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Eroare: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Nicio rețetă găsită.'));
          } else {
            final List<Recipe> retete = snapshot.data!;
            return Stack(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      const SizedBox(height: 15),
                      searchBox(),
                      Expanded(
                        child: ListView.builder(
                          itemCount: retete.length,
                          itemBuilder: (context, index) {
                            final recipe = retete[index];
                            return Card(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ViewReteta(reteta: recipe),
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        recipe.name ?? 'Rețetă Fără Nume',
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                      const Icon(Icons.arrow_forward),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    child: FloatingActionButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AdaugaReteta(),
                          ),
                        );
                      },
                      child: const Icon(Icons.add, color: Colors.white),
                      backgroundColor: const Color.fromARGB(255, 174, 61, 194),
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  Widget searchBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Caută rețetele",
                hintStyle: TextStyle(color: Colors.black54),
                border: InputBorder.none,
              ),
            ),
          ),
          const Icon(Icons.search, color: Colors.black54),
        ],
      ),
    );
  }
}
