import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'OurServices/mechanicPage.dart';
class MechanicDetailsScreen extends StatelessWidget {
  final Mechanic mechanic;

  const MechanicDetailsScreen({super.key, required this.mechanic});




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mechanic Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              mechanic.name,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Phone Number:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              mechanic.phoneNumber,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Location:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              mechanic.city,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement message sending functionality
              },
              child: Text('Send Message'),
            ),
          ],
        ),
      ),
    );
  }
}
