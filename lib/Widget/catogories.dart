


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yummy_bites/Raw_Data/elements.dart';

class QuickFood extends StatelessWidget {
  const QuickFood({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        child: ListView.separated(
            separatorBuilder: (context, int index) {
              return SizedBox(
                width: 5,
              );
            },
            scrollDirection: Axis.horizontal,
            itemCount: data.length,
            itemBuilder: (context, int index) {
              return InkWell(
                onTap: () {
                  print(data[index].name);
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(25)),
                  width: 69,
                  child: Center(
                    child: Text(
                      data[index].name.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Dosis',
                          fontSize: 15,
                          color: Colors.white),
                    ),
                  ),
                ),
              );
            }));
  }
}