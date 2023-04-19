import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled/pages/auth/reset_pass/fpass.dart';
import 'package:untitled/pages/auth/signup.dart';
import 'package:untitled/pages/core/main_screen.dart';
import 'package:untitled/util/Colores.dart';
class login_page extends StatefulWidget {
  const login_page({Key? key}) : super(key: key);

  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  TextEditingController emailInputCtrl = TextEditingController();
  TextEditingController _passInputCtrl = TextEditingController();
  TextEditingController _forgetInputCtrl = TextEditingController();
  bool _ispassobscure = true;
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white24,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(32) ,
          color:Colors.white24,
          width:double.maxFinite ,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [TextField(
              keyboardType: TextInputType.emailAddress ,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
                hintText: "Email ID",
                suffixIcon: Icon( Icons.email_outlined ,
                color:AppColors.blueG ) ,


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
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                    suffix: TextButton(onPressed: (){
                      setState(() {
                        _ispassobscure = ! _ispassobscure ;
                      });

                    },
                      child:
                      Text( _ispassobscure ? 'show' : 'hide',

                         style:(TextStyle(fontSize:16,fontWeight: FontWeight.w300,color: Colors.blue, ))),),
                    labelText:'password' ,
                    suffixIcon: Icon( Icons.lock_outlined,
                        color: AppColors.blueG)

                    ),
              controller: _passInputCtrl,
            ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: (){
                    controller: _forgetInputCtrl ;
                    Navigator.push(context, CupertinoPageRoute(builder:(context) => Rtpassword()   ) ) ;
                  },
                    child:
                    const Text(  'Forget your password ? '  ,
                        style:(TextStyle(fontSize:16,fontWeight: FontWeight.w300,color: Colors.grey,fontFamily: "Castoro" ))),
                  ),
                ],
              ),
              const SizedBox(
                height: 20 ,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                      CupertinoButton(child: Text('LOGIN',style:TextStyle(color: Colors.black,fontFamily: "Castoro"), ),
                        onPressed:() {Navigator.push(context, CupertinoPageRoute(builder:(context) => MyHomePage()   ) ) ;}, color:AppColors.blueG  , ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text(  "don't have an account  "  ,
                    style:(TextStyle(fontSize:16,fontWeight: FontWeight.w100,color: Colors.black, fontFamily: "Castoro"))),

                  TextButton(
                    child: Text(  'Register Now'  ,
                        style:(TextStyle(fontSize:16,fontWeight: FontWeight.w100,color: AppColors.blueG , fontFamily: "Castoro"))),
                    onPressed: () {
                      Navigator.push(context, CupertinoPageRoute(builder:(context) => SignUpPage()   ) ) ;
                    },
                  ),
                ],
              ),

            ],
          ) ,

        ),

      ),
    );
  }
}
