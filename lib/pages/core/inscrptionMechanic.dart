import 'package:flutter/material.dart';

class MechanicPage extends StatefulWidget {
  @override
  _MechanicPageState createState() => _MechanicPageState();
}

class _MechanicPageState extends State<MechanicPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController garageController = TextEditingController();
  bool canMove = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("Zone de mécanicien"),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Coordonnées"),
            SizedBox(height: 8.0),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Nom et prénom",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Icon(Icons.phone),
                SizedBox(width: 8.0),
                Expanded(
                  child: TextField(
                    controller: phoneController,
                    decoration: InputDecoration(
                      labelText: "Numéro de téléphone",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Icon(Icons.location_on),
                SizedBox(width: 8.0),
                Expanded(
                  child: TextField(
                    controller: garageController,
                    decoration: InputDecoration(
                      labelText: "Lieu du garage",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Text("Peut se déplacer ?"),
                SizedBox(width: 8.0),
                Switch(
                  value: canMove,
                  onChanged: (value) {
                    setState(() {
                      canMove = value;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 16.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Code pour ajouter le mécanicien
                  String name = nameController.text;
                  String phone = phoneController.text;
                  String garage = garageController.text;
                  print("Ajout du mécanicien : $name, $phone, $garage, $canMove");
                },
                child: Text("Ajouter"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
