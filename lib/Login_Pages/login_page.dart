import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yummy_bites/Login%20Componenets/email_pass_field.dart';
import 'package:yummy_bites/Login%20Componenets/for%20sign%20up%20txt.dart';
import 'package:yummy_bites/Login%20Componenets/loginToHomebtn.dart';
import 'package:yummy_bites/Login_Pages/to_login_page.dart';
import 'package:yummy_bites/Pages/home_page.dart';

class LoginPage extends StatelessWidget {
   LoginPage({Key? key}) : super(key: key);

  final formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.fill,
          colorFilter: ColorFilter.mode(Colors.transparent, BlendMode.darken),
          image: AssetImage("asset/images/Restaraunt 3.jpg"),
        )),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40))),
                width: double.infinity,
                height: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "Welcome",
                        style: GoogleFonts.poppins(
                          textStyle:
                              TextStyle(fontSize: 40, color: Colors.white),
                        ),
                      ),
                    ),
                    LoginInput(
                      text: "Email",
                      inputType: TextInputType.text,
                      obscureText: false,
                      error: "Email must be filled",
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    LoginInput(
                      text: "Password",
                      inputType: TextInputType.text,
                      obscureText: true,
                      error: "Password must be filled",
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    LoginToHomeBtn(),
                    SizedBox(
                      height: 15,
                    ),
                    For_Sign_Up()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}






