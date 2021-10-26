import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yummy_bites/Pages/home_page.dart';

class LoginToHomeBtn extends StatelessWidget {
  LoginToHomeBtn({
    Key? key,
  }) : super(key: key);

  // final  value;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>CustomeBottomNavigationBar()));
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
                  ])),
          child: Center(
            child: RichText(
              text: TextSpan(
                text: "Login",
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}