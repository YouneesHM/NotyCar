
import 'package:flutter/material.dart';

class DemandePage extends StatefulWidget {
  @override
  _DemandePageState createState() => _DemandePageState();
}
class _DemandePageState extends State<DemandePage> {

  final _formKey = GlobalKey<FormState>();
  String description = '';
  String destinataire = '';

  void _envoyerDemande() {
    // Code pour envoyer la demande
    print('Demande envoyée à $destinataire : $description');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('repair request',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              onChanged: (value) {
                setState(() {
                  destinataire = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Recipient',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Pleace enter your recipient';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  description = value;
                });
              },
              maxLines: null,
              decoration: InputDecoration(
                labelText: 'Description de la panne',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Veuillez entrer une description';
                }
                return null;
              },
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _envoyerDemande();
                }
              },
              child: Text('Demander'),
            ),
          ],
        ),
      ),
    );
  }
}