import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginInput extends StatelessWidget {
  LoginInput(
      {Key? key, required this.text, required this.inputType, this.obscureText,required this.error})
      : super(key: key);

  final String text;
  final TextInputType inputType;
  final bool? obscureText;
  final String error;
  final formKey=GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: TextFormField(
        validator: (value){
          if(value!.isEmpty){
            return error;
          }



        },
        style: GoogleFonts.poppins(
          textStyle:
          TextStyle(color: Colors.white, letterSpacing: 2.0, fontSize: 20),
        ),
        obscureText: obscureText!,
        keyboardType: inputType,
        decoration: InputDecoration(
          hintText: text,
          hintStyle: GoogleFonts.poppins(
            textStyle:
            TextStyle(color: Colors.white, letterSpacing: 2.0, fontSize: 20),
          ),
          filled: true,
          fillColor: Colors.black,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}