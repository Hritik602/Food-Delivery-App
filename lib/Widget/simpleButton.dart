

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yummy_bites/Colors/appColors.dart';
import 'package:yummy_bites/Store/myStore.dart';

class Button extends StatelessWidget {
  Button(
      {Key? key,
        required this.store,
        required this.text,
        required this.width,
        required this.height})
      : super(key: key);

  final MyStore store;
  final String text;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            color: AppColors.blue,
            borderRadius: BorderRadius.horizontal(
              left: Radius.circular(20),
              right: Radius.circular(20),
            )),
        width: width,
        height: height,
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    letterSpacing: 1.0)),
          ),
        ));
  }
}