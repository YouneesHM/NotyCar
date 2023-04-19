import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled/pages/auth/signin.dart';
import 'package:untitled/util/Colores.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailInputCtrl = TextEditingController();
  TextEditingController _passInputCtrl = TextEditingController();
  TextEditingController userInputCtrl = TextEditingController();
  bool _ispassobscure = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold (
        backgroundColor: Colors.white24,
        body: SafeArea(
        child: Container(
        margin: EdgeInsets.all(32) ,
    color:Colors.white24,
    width:double.maxFinite ,
    height: MediaQuery.of(context).size.height,
    child: Column(
      children: [
        Text(  'create an account'  ,
            style:(TextStyle(fontSize:16,fontWeight: FontWeight.w100,color: AppColors.blueG, fontFamily: "Castoro"))),
        const SizedBox(
          height:20 ,
        ),

        TextField(
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)
              ),

              hintText:'User name ' ,
              suffixIcon: Icon( Icons.person,
                  color: AppColors.blueG)

          ),
          controller: userInputCtrl,
        ),
        const SizedBox(
          height:20 ,
        ),
        TextField(

          keyboardType: TextInputType.emailAddress ,
          decoration: InputDecoration(


              hintText: "Email ID "  ,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)
              ),
              suffixIcon: Icon( Icons.email_outlined ,
                  color: AppColors.blueG)

          ),
          controller: emailInputCtrl ,
        ),
        const SizedBox(
          height:20 ,
        ),
        TextField(

          keyboardType: TextInputType.text,
          obscureText: _ispassobscure,

          decoration: InputDecoration(
              suffix: TextButton(onPressed: (){
                setState(() {
                  _ispassobscure = ! _ispassobscure ;
                });

              },
                child:
                Text( _ispassobscure ? 'show' : 'hide',

                    style:(TextStyle(fontSize:15,fontWeight: FontWeight.w300,color: Colors.black,fontFamily: "Castoro" ))),),
              hintText:'Password' ,
              suffixIcon: Icon( Icons.lock_outlined,
                  color: AppColors.blueG) ,
              border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)
        ),

          ),
          controller: _passInputCtrl,
        ),
        const SizedBox(
          height:26 ,
        ),

        Row(
         mainAxisAlignment: MainAxisAlignment.center,
          children: [


                CupertinoButton( child:  Text("REGISTER" ,style:TextStyle(color: Colors.black , fontFamily: "Castoro"   ), ),
                  onPressed:() {}, borderRadius:BorderRadius.circular(20) , color: AppColors.blueG  , ),

          ],
        ),
        const SizedBox(
          height: 26 ,
        ),
        Text(  ' OR '  ,
            style:(TextStyle(fontSize:16,fontWeight: FontWeight.w100,color: Colors.black, fontFamily: "Castoro"))),

         Row(
            mainAxisAlignment: MainAxisAlignment.center,
           children: [
             CupertinoButton (
               child: Image.asset("assets/images/GL.png" ,
                 height: 50,
                 width: 40,
               ),
                 onPressed:() {}
             ),
             const SizedBox(
               width: 14,
             ),
             CupertinoButton (
                 child: Image.asset("assets/images/tw.png" ,
                   height: 64,
                 ),
                 onPressed:() {}

             ),
             const SizedBox(
               width: 14,
             ),
             CupertinoButton (
                 child: Image.asset("assets/images/FBK.png" ,
                   height: 50,

                 ),
                 onPressed:() {}

             ),

           ],
         ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(  'Already have an account?'  ,
              style:(TextStyle(fontSize:16,fontWeight: FontWeight.w100,color: Colors.black, fontFamily: "Castoro"))),

            TextButton(
              child: Text(  'LOGIN'  ,
                  style:(TextStyle(fontSize:16,fontWeight: FontWeight.w100,color: AppColors.blueG, fontFamily: "Castoro"))),
              onPressed: () {
                Navigator.push(context, CupertinoPageRoute(builder:(context) => login_page()   ) ) ;
              },
            ),
          ],
        ),
      ],



    )

    ),
        ),
    );

  }
}
