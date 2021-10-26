import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yummy_bites/Colors/appColors.dart';
import 'package:yummy_bites/Login_Pages/login_page.dart';

class ToLoginPage extends StatelessWidget {
  const ToLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("asset/images/Pizza for screen.jpg",
            ),
            fit: BoxFit.fill,
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ThemeText(),
            SizedBox(height: 70,),
            LoginButton(text: "Login",fontSize: 30,),
            SizedBox(height: 8.0,),
            LoginButton(text: "Connect With FaceBook",fontSize: 20,),

          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class LoginButton extends StatelessWidget {
  LoginButton({
    Key? key,required this.text,required this.fontSize,
  }) : super(key: key);

  final String text;
  final double fontSize;

  

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Container(
          width: double.infinity,
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.yellowAccent.shade400,
                Colors.red.shade700,

              ]
            )
            ),
          child: Center(
            child: RichText(
              text: TextSpan(
                text: text,
            style:GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: fontSize,
                color: Colors.white,
              )
            ) ,
            ),
          ),

          ),
      ),



      ),
    );
  }
}
// Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
class ThemeText extends StatelessWidget {
  const ThemeText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: RichText(

          text: TextSpan(
            text: " TAP TO ORDER NOW\n DELIVERED \n YOUR FAVOURITE \n FOOD TO YOUR \n DOOR.",
            style:GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 30,
              )
            )

      )
      ),
    );
  }
}
