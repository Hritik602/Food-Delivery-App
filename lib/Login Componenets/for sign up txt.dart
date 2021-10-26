// ignore: camel_case_types
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class For_Sign_Up extends StatelessWidget {
  const For_Sign_Up({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
          TextSpan(
            text: "Don'\tt have an Account ?",
            style: GoogleFonts.poppins(fontSize: 18, color: Colors.white),
          ),
          TextSpan(
              text: "\t\tSign Up",
              style: GoogleFonts.poppins(
                fontSize: 18,
                color: Colors.blueAccent,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  print("clicked");
                }),
        ]));
  }
}