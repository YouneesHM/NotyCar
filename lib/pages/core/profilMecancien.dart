import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileDisplayPage extends StatelessWidget {
  final String firstName;
  final String lastName;
  final DateTime? dateOfBirth;
  final String gender;
  final String phoneNumber;
  final String government;

  ProfileDisplayPage({
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
    required this.gender,
    required this.phoneNumber,
    required this.government,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/AMouna.png'),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Name:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Text('$firstName $lastName', style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            Text(
              'Date of Birth:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              '${dateOfBirth?.day}/${dateOfBirth?.month}/${dateOfBirth?.year}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Gender:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(gender, style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            Text(
              'Phone Number:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(phoneNumber, style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            Text(
              'Government:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(government, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

