import 'package:flutter/material.dart';
import 'package:caloriesense/models/ing.dart';

class Ingredient1 extends StatelessWidget {
  final Ing ing;
  final Function(String) onDelete;

  const Ingredient1({Key? key, required this.ing, required this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: ListTile(
        onTap: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        title: Text(
          ing.name!,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(0),
              margin: EdgeInsets.symmetric(horizontal: 4),
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 241, 209, 27),
                borderRadius: BorderRadius.circular(5),
              ),
              child: IconButton(
                icon: Icon(Icons.edit),
                color: Colors.white,
                iconSize: 15,
                onPressed: () {},
              ),
            ),
            Container(
              padding: EdgeInsets.all(0),
              margin: EdgeInsets.symmetric(horizontal: 4),
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(5),
              ),
              child: IconButton(
                icon: Icon(Icons.delete),
                color: Colors.white,
                iconSize: 15,
                onPressed: () {
                  onDelete(ing.id ?? '');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
