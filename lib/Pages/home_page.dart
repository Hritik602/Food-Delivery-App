import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:yummy_bites/Colors/appColors.dart';

import 'package:yummy_bites/List_of_Restaurant/list_of_restaurant.dart';

import 'package:yummy_bites/Pages/cart_page.dart';
import 'package:yummy_bites/Pages/itemDetailPage.dart';
import 'package:yummy_bites/Restaurant_Detail/restaurant_detail.dart';

import 'package:yummy_bites/Store/restStore.dart';
import 'package:yummy_bites/Widget/ad_picture.dart';

import 'package:yummy_bites/Store/myStore.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var store = Provider.of<MyStore>(context);
    var restStore = Provider.of<RestStore>(context);
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Header(restStore:restStore),
                SizedBox(
                  height: 10,
                ),
                // AdPic(),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Categories",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Categories(),

                Text(
                  "Popular This Week",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    margin: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    height: 262,
                    child: ListView.separated(
                        separatorBuilder: (context, int index) {
                          return SizedBox(
                            width: 20,
                          );
                        },
                        scrollDirection: Axis.horizontal,
                        itemCount: store.product.length,
                        itemBuilder: (context, int index) {
                          return InkWell(
                            onTap: () {
                              store.setActiveProducts = (store.product[index]);
                              print(store.product[index]);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ItemDetailPage()));
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 200,
                              height: 262,
                              color: Colors.transparent,
                              child: Stack(
                                // mainAxisAlignment:
                                //     MainAxisAlignment.spaceBetween,
                                children: [
                                  itemPic(store: store, index: index),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Positioned(
                                    right: 50,
                                    bottom: 1,
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 0.1, sigmaY: 0.1),
                                      child: Container(
                                        width: 150,
                                        height: 110,
                                        color: Colors.white.withOpacity(1),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              store.product[index].name.toString(),
                                              style: TextStyle(
                                                  fontSize: 28,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            Text(
                                              "Rs.${store.product[index].price.toString()}",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18),
                                            ),
                                            Addtocart(
                                              store: store,
                                              index: index,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        })),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 20,
                ),
                // ChooseRestaurant()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
   Header({Key? key,required this.restStore}) : super(key: key);

  RestStore restStore;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        height: 370,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken   ),
            fit: BoxFit.cover,
            image: AssetImage("asset/images/Restaurant 2.jpg"),
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              color: Colors.white.withOpacity(0.9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Yummy Bites ",
                    textAlign: TextAlign.center,
                    strutStyle: StrutStyle.disabled,
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.black,
                          fontSize: 30,
                        )
                    ),
                  ),
                  CircleAvatar(
                    radius: 25,
                      backgroundColor: Colors.yellow.shade700,
                      child: Text(restStore.cart.length.toString(),
                      style: TextStyle(
                        fontSize:24,
                        color: Colors.white
                      ),
                      )
                  )
                ],
              ),
            ),
            SearchBox(),
            AdPic()
          ],
        ),
      ),
    );
  }
}


class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
          separatorBuilder: (BuildContext context,int index){
            return SizedBox(width: 10,);
          },
        itemCount: 7,
          itemBuilder: (context,int itemIndex){
            return InkWell(
              onTap: (){
                ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                  content: Text("Sorry It Is Disabled !",
                  ),
                  backgroundColor: Colors.redAccent,
                )
                );
              },

              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 5.0),
                width: 110,
                height: 150,


                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                   Container(
                     width: 110,
                     height: 100,
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(10),
                         gradient: LinearGradient(
                             begin: Alignment.centerLeft,
                             end: Alignment.centerRight,
                             colors: [
                               // Colors.red.shade700,
                               Colors.yellowAccent.shade400,
                               Colors.red.shade700,

                             ]
                         )
                     ),
                     child: Center(
                       child: Image.asset("asset/images/dinner-table.png",
                         fit: BoxFit.cover,
                         width: 90,
                         height: 90,
                         color: Colors.white.withOpacity(0.9),
                       ),
                     ),
                   ),
                    Text("Menu",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                      ),
                    ),

                  ],
                ),

              ),
            );
          },


      ),
    );
  }
}


class SearchBox extends StatelessWidget {
  const SearchBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        validator: (value) {},
        style: GoogleFonts.poppins(
          textStyle: TextStyle(
              color: Colors.white, letterSpacing: 2.0, fontSize: 10),
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: Colors.white,
          ),
          hintText: "Search Restaurant/Food",
          hintStyle: GoogleFonts.poppins(
            textStyle: TextStyle(
                color: Colors.white,
                letterSpacing: 2.0,
                fontSize: 15),
          ),
          filled: true,
          fillColor: Colors.black.withOpacity(0.9),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

class CustomeBottomNavigationBar extends StatefulWidget {
  CustomeBottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomeBottomNavigationBar> createState() =>
      _CustomeBottomNavigationBarState();
}

class _CustomeBottomNavigationBarState
    extends State<CustomeBottomNavigationBar> {
  int currentIndex = 0;
  bool select = true;
  List<Widget> pages = [HomePage(), ListOfRestaurant(),CartScreen(),];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          selectedItemColor: Colors.redAccent,
          unselectedItemColor: Colors.white,
          onTap: (index) {
            setState(() {
              currentIndex = index;
              select = false;
            });
            // Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreen()));
          },
          backgroundColor: Colors.black.withOpacity(0.8),
          elevation: 10,
          items: [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: "Restaurant",
              icon: Icon(Icons.restaurant,
              ),
            ),
            BottomNavigationBarItem(
              label: "Cart",
              icon: select == true
                  ? Text("1")
                  : Icon(Icons.add_shopping_cart_outlined),
            )
          ]
      ),
      body: pages.elementAt(currentIndex),
    );
  }
}

// ignore: camel_case_types
class itemPic extends StatelessWidget {
  const itemPic({
    Key? key,
    required this.index,
    required this.store,
  }) : super(key: key);

  final int index;

  final MyStore store;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(10),
          shape: BoxShape.circle,
        ),
        width: 203,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          child: Image.asset(
            store.product[index].image!,
            fit: BoxFit.cover,
          ),
        ));
  }
}

class Addtocart extends StatelessWidget {
  const Addtocart({
    Key? key,
    required this.index,
    required this.store,
  }) : super(key: key);

  final int index;

  final MyStore store;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: (!store.cart.contains(store.product[index]))
            ? Consumer<MyStore>(
                builder: (context, myStore, child) => InkWell(
                    onTap: () {
                      store.setActiveProducts = (store.product[index]);

                      store.addItemToCart(store.activeProduct!);
                      print(store.activeProduct!);
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Item is Added to Cart ")));
                    },
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      width: 128,
                      height: 30.15,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "Add to cart",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                    )),
              )
            : Container(
                padding: EdgeInsets.all(8.0),
                width: 128,
                height: 30.15,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "Add to cart",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
              ));
  }
}

class ChooseRestaurant extends StatelessWidget {
  const ChooseRestaurant({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            child: Container(
              width: double.infinity,
              height: 150,
              child: Image.asset(
                "asset/images/cafe.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Restaurant",
                style: GoogleFonts.lato(
                    textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                      color: Colors.white,
                )),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ListOfRestaurant()));
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 25,
                    color: Colors.white,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
