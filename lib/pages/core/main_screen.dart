
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:untitled/pages/core/bottomNviGationBar/profil.dart';
import 'package:untitled/pages/core/profilMecancien.dart';
import 'package:untitled/pages/core/OurServices/mechanicPage.dart';
import 'package:untitled/util/Colores.dart';
import '../../services/_location.dart';
import 'OtherServices/hotelscreen.dart';
import 'OurServices/BornePage.dart';
import 'OurServices/KiosquePage.dart';
import 'bottomNviGationBar/faVories.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0 ;

  var firstName="" ;

  

  get lastName => "";

  get dateOfBirth => null;

  get gender => "";

  get phoneNumber => "";

  get selectedGovernment => "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyW,

      appBar:AppBar(
        automaticallyImplyLeading: false,
        title: Image.asset("assets/images/logo.png",
        height: 90,
          width: 130,
        ),
        backgroundColor: AppColors.blueG,
        elevation: 20,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            color: Colors.white,
            onPressed: () {},
          ),
          const SizedBox(
            width: 24,
          ),
          IconButton(
            icon: Icon(Icons.person_outline),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
          const SizedBox(
            width: 24,
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            color: Colors.white,
            onPressed: () {
              // Do something when notification icon is pressed
            },
          ),
          MaterialButton(
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => ProfileDisplayPage(
                    firstName: firstName,
                    lastName: lastName,
                    dateOfBirth: dateOfBirth,
                    gender: gender,
                    phoneNumber: phoneNumber,
                    government: selectedGovernment,
                  ),
                ),
              );
            },
            child: Column(
              children: [
                Icon(Icons.person, color: Colors.white),
              ],
            ),
          ),
        ],
      ),




        body:

      SingleChildScrollView(
        child: Stack(

          children: [
            SafeArea(
              child : Expanded (
              child: Column(
                children: [
                  Container(

                    decoration:BoxDecoration (
                        color:Color(0xFFF6F5F5),
                        borderRadius : BorderRadius.circular(20)),
                    margin: EdgeInsets.only(left:30,top: 30,right: 30,bottom: 50 ) ,

                    width:550 ,
                    height: 300,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 16),

                        Row( mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '  Our Services :',
                              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,fontFamily: "Castoro", color:Color(0xFF276678) ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CupertinoButton (
                              child : Image.asset("assets/images/MKANSIEN.png",
                                height: 65,
                                width: 65,
                              ),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder:(context) => MechanicListPage()   ) ) ;
                              },
                            ),
                            CupertinoButton (
                              child : Image.asset("assets/images/google-maps.png",
                                height: 65,
                                width: 65,
                              ),
                              onPressed: () {
                                Navigator.push(context, CupertinoPageRoute(builder:(context) => MapScreen()   ) ) ;
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CupertinoButton (
                              child: Image.asset("assets/images/kioskk.png",
                                height: 70,
                                width: 70,
                              ),
                              onPressed: () {
                                Navigator.push(context, CupertinoPageRoute(builder:(context) => KiosquePg()   ) ) ;
                              },
                            ),
                             CupertinoButton (
                              child : Image.asset("assets/images/Isos.png",
                                height: 70,
                                width: 70,
                              ),
                              onPressed: () {
                                Navigator.push(context, CupertinoPageRoute(builder:(context) => BornePg()   ) ) ;
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row( mainAxisAlignment: MainAxisAlignment.start,
                    children:const  [
                      Text(
                        '  Other Services :',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,fontFamily: "Castoro", color:Color(0xFF276678)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    height: 150,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 16),
                          width: 200,
                          decoration: BoxDecoration(
                            color: Color(0xFFF6F5F5),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.ac_unit),
                              SizedBox(height: 8),
                              Text('Les hotels'),
                              IconButton(
                                icon: Icon(Icons.arrow_forward),
                                onPressed: () {Navigator.push(context, CupertinoPageRoute(builder:(context) => HotelListView()   ) ) ;

                                },
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 16),
                          width: 200,
                          decoration: BoxDecoration(
                            color:Color(0xFFF6F5F5),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.ac_unit),
                              SizedBox(height: 8),
                              Text('les restaurant et les cafe'),
                              IconButton(
                                icon: Icon(Icons.arrow_forward),
                                onPressed: () {
                                  // Add functionality here
                                },
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 16),
                          width: 200,
                          decoration: BoxDecoration(
                            color: Color(0xFFF6F5F5),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.ac_unit),
                              SizedBox(height: 8),
                              Text('Service 3'),
                              IconButton(
                                icon: Icon(Icons.arrow_forward),
                                onPressed: () {
                                  // Add functionality here
                                },
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 16),
                          width: 200,
                          decoration: BoxDecoration(
                            color: Color(0xFFF6F5F5),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.ac_unit),
                              SizedBox(height: 8),
                              Text('Service 4'),
                              IconButton(
                                icon: Icon(Icons.arrow_forward),
                                onPressed: () {
                                  // Add functionality here
                                },
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 16, right: 16),
                          width: 200,
                          decoration: BoxDecoration(
                            color: Color(0xFFF6F5F5),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.ac_unit),
                              SizedBox(height: 8),
                              Text('Service 5'),
                              IconButton(
                                icon: Icon(Icons.arrow_forward),
                                onPressed: () {
                                  // Add functionality here
                                },
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),








                ],
              ),
                
            ),
              
            ),
            
          ],
          
        ),
        
      ),
        bottomNavigationBar:
         DecoratedBox(
            decoration: BoxDecoration(


              gradient: LinearGradient(
                colors: [AppColors.greyW, Colors.white30],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Container(
              height: 70,

              child: GNav(
                gap: 10,
                color: AppColors.blueG,
                iconSize: 24,
                tabBackgroundColor: AppColors.greyW,
                padding: EdgeInsets.all(8),
                tabs: [
                  GButton(
                    icon: Icons.home ,
                    text: 'Home',
                    iconActiveColor: AppColors.blueG,
                    textColor: AppColors.blueG,
                  ),
                  GButton(
                    icon: Icons.favorite,
                    text: 'Favorites',
                    iconActiveColor: Colors.redAccent,textColor: Colors.redAccent,
                  ),
                  GButton(
                    icon: Icons.person,
                    text: 'profil',
                    iconActiveColor: Colors.black,
                    textColor: Colors.black,

                  ),
                  GButton(
                    icon: Icons.settings,
                    text: 'settings',
                    iconActiveColor: Colors.grey.shade700,textColor: Colors.grey.shade700,

                  ),
                ],
                selectedIndex: _currentIndex,
                onTabChange: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
          ),









    );
  }
}






















