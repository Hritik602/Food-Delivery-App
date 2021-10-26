import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:yummy_bites/Store/restStore.dart';
import 'package:yummy_bites/Widget/cutome_tabbar.dart';

// ignore: must_be_immutable
class IndividualCafe extends StatefulWidget {
  IndividualCafe({Key? key}) : super(key: key);

  @override
  _IndividualCafeState createState() => _IndividualCafeState();
}

class _IndividualCafeState extends State<IndividualCafe>
    with SingleTickerProviderStateMixin {
  PageController? pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: 0, viewportFraction: 0.9);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    var restStore = Provider.of<RestStore>(context, listen: false);
    return Scaffold(
        backgroundColor: Colors.white.withOpacity(0.9),
        body: SafeArea(
          child: Container(
            child: Consumer(
              builder: (context, restDetail, child) => Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 220,
                          child: Image.asset(
                            "asset/images/best-delicious-food.jpg",
                            fit: BoxFit.fill,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 85),
                          child: Text(
                            restStore.activeCafe!.restaurantName.toString(),
                            style: TextStyle(fontSize: 45),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Colors.redAccent,
                            ),
                            Text(
                              restStore.activeCafe!.address.toString(),
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                color: Colors.red,
                                fontSize: 18,
                              )),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            //  Cafe_facility(text: 'Free', icon:Icon(Icons.delivery_dining,color: Colors.redAccent,)),
                            // Cafe_facility(text: "10-20min", icon: Icon(Icons.watch_later_sharp,color: Colors.grey,)),
                            // Cafe_facility(text: "4.8", icon: Icon(Icons.star_outlined,color: Colors.red,))
                          ],
                        ),
                        Divider(
                          height: 30,
                          thickness: 5.0,
                          endIndent: 20,
                          indent: 20,
                          color: Colors.black38,
                        ),
                        Text(
                          "Menu",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                          )),
                        ),
                        SizedBox(
                          height: 10,
                        ),


                        SizedBox(
                            height: 55,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              separatorBuilder: (context, int index) =>
                                  VerticalDivider(
                                width: 20,
                              ),
                              itemCount: restStore.activeCafe!.category!.length,
                              itemBuilder: (context, int index) {
                                return Consumer(
                                  builder: (context, custometab, child) =>
                                      CustomTabbar(
                                          restStore: restStore, index: index),
                                );
                              },
                            )),

                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                            height: 100,
                            child: ListOfVariety(
                              restStore: restStore,
                            )),
                      ],
                    ),
                  ),
                  Positioned(
                      top: 10,
                      left: 20,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back),
                        ),
                      )),
                  Positioned(
                      top: 150,
                      left: 110,
                      child: CircleAvatar(
                        radius: 75,
                        backgroundColor: Colors.grey.withOpacity(0.8),
                        child: CircleAvatar(
                          radius: 70.0,
                          backgroundImage: AssetImage("asset/images/cafe.jpg"),
                        ),
                      ))
                ],
              ),
            ),
          ),
        ));
  }
}

// ignore: camel_case_types, must_be_immutable
class Cafe_facility extends StatelessWidget {
  Cafe_facility({Key? key, required this.text, required this.icon})
      : super(key: key);
  String text;
  Widget icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 95,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.grey.withRed(100),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          icon,
          Text(text,
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                fontSize: 15,
              )))
        ],
      ),
    );
  }
}
