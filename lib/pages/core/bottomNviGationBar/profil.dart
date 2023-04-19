import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/util/Colores.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String firstName = '';
  String lastName = '';
  DateTime? dateOfBirth;
  String gender = '';
  String phoneNumber = "";
  List<String> governmentList = [
    'Ariana',
    'Beja',
    'Ben Arous',
    'Bizerte',
    'Gabes',
    'Gafsa',
    'Jendouba',
    'Kairouan',
    'Kasserine',
    'Kebili',
    'Kef',
    'Mahdia',
    'Manouba',
    'Medenine',
    'Monastir',
    'Nabeul',
    'Sfax',
    'Sidi Bouzid',
    'Siliana',
    'Sousse',
    'Tataouine',
    'Tozeur',
    'Tunis',
    'Zaghouan',
  ];

  String selectedGovernment = '';


  @override
  Widget build(BuildContext context) {
    selectedGovernment = governmentList[0];

    return Scaffold(backgroundColor: AppColors.greyW,
      appBar: AppBar(
        title: const Text('EditProfil'),
        backgroundColor: AppColors.blueG ,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            )
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            SafeArea(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage("assets/images/AMouna.png"),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'First Name',
                      ),
                      onChanged: (value) {
                        setState(() {
                          firstName = value;
                        });
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Last Name',
                      ),
                      onChanged: (value) {
                        setState(() {
                          lastName = value;
                        });
                      },
                    ),
                    SizedBox(height: 10),
                    GestureDetector(
                      onTap: () async {
                        final selectedDate = await showDatePicker(
                          context: context,
                          initialDate: dateOfBirth ?? DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                          // Ajouter le style pour changer la couleur de la date en rouge
                          // et le mettre en gras
                          builder: (BuildContext context, Widget? child) {
                            return Theme(
                              data: ThemeData.dark().copyWith(
                                colorScheme: ColorScheme.dark(
                                  primary: AppColors.blueG,
                                  onPrimary: Colors.white,
                                ),

                              ),
                              child: child!,
                            );
                          },
                        );
                        if (selectedDate != null) {
                          setState(() {
                            dateOfBirth = selectedDate;
                          });
                        }
                      },
                      child: InputDecorator(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Date of Birth',
                        ),
                        child: Text(
                          dateOfBirth != null
                              ? '${dateOfBirth!.day}/${dateOfBirth!.month}/${dateOfBirth!.year}'
                              : '',
                        ),
                      ),
                    ),

                    SizedBox(height: 10),

                        Text(
                          'Gender : ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                    SizedBox(width: 10),
                    RadioListTile(
                      title: Text('Male'),
                      value: 'Male',
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value.toString();
                        });
                      },
                    ),
                      const  SizedBox(width: 10) ,
                    RadioListTile(
                      title: Text('Female'),
                      value: 'Female',
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value.toString();
                        });
                      },
                    ),

                    SizedBox(height: 10),
                    TextField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        border: OutlineInputBorder(),
                        labelText: 'Phone Number',
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          phoneNumber = value;
                        });
                      },
                    )
                    ,
                    SizedBox(height: 20),
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                        labelText: 'Government',
                        border: OutlineInputBorder(),
                      ),
                      value: selectedGovernment,
                      items: governmentList.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedGovernment = value.toString();

                        });
                        if (!governmentList.contains(selectedGovernment)) {
                          selectedGovernment = governmentList[0];
                        }

                      },


                    ),



                    SizedBox(height: 20),
                    Center(
                      child: CupertinoButton(
                        onPressed: () {

                          // TODO: implement update functionality
                          print('Updating profile...');
                          print('First Name: $firstName');
                          print('Last Name: $lastName');
                          print('Date of Birth: $dateOfBirth');
                          print('Gender: $gender');
                          print('Phone Number: $phoneNumber');
                        },
                        child: Text('Update'),
                          color:AppColors.blueG
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),);
  }
}