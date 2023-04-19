import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/pages/auth/signin.dart';
import 'package:untitled/pages/auth/signup.dart';
import 'package:untitled/util/Colores.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return
          Scaffold(
              backgroundColor: Colors.white24,
            body: Stack(

              children:
              [


                Image.asset("assets/images/fond.jpg",
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height,
                ),
                SafeArea(

                    child:

                    Container(
                      decoration:BoxDecoration (
                          color:Colors.white70,
                          borderRadius : BorderRadius.circular(20)),
                      margin: EdgeInsets.only(left:100,top: 100,right: 100,bottom: 100 ) ,

                      width:double.maxFinite ,
                      height: MediaQuery.of(context).size.height,
                      child: Column(

                        children:[


                           Text(
                              'NotyCar',
                              style: TextStyle(
                                fontSize: 35,
                                  color: AppColors.blueG ,
                                fontWeight: FontWeight.bold,fontFamily: "Castoro"), ),
                           SizedBox(
                            height:20 ,
                          ),

                          Text(  'Find kiosk   SOS   or   a   mechanic',
                              style:(TextStyle
                                (fontSize:16,fontWeight: FontWeight.w300,
                                  color: Colors.black, fontFamily: "Castoro",
                              ))),

                           SizedBox(
                            height:150,
                          ),
                          CupertinoButton(child: Text("LOG IN" ,style:TextStyle(color: Colors.black , fontFamily: "Castoro"   ), ),
                            onPressed:() { Navigator.push(context, CupertinoPageRoute(builder:(context) => login_page()   ) ) ;}, borderRadius:BorderRadius.circular(20) , color:AppColors.blueG , ),
                          SizedBox(
                            height:20,
                          ),
                          CupertinoButton(child: Text("REGISTER" ,style:TextStyle(color: Colors.black , fontFamily: "Castoro" ,   ), ),
                            onPressed:()
                            {  Navigator.push(context, CupertinoPageRoute(builder:(context) => SignUpPage()   ) ) ; }, borderRadius:BorderRadius.circular(20) , color:AppColors.blueG,

                          ),


                        ],

                      ),

                    ),
                  ),



              ],

            ),

            );



  }

}