import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:yummy_bites/Colors/appColors.dart';
import 'package:yummy_bites/List_of_Restaurant/list_of_restaurant.dart';
import 'package:yummy_bites/Pages/cart_page.dart';
import 'package:yummy_bites/Pages/itemDetailPage.dart';
import 'package:yummy_bites/Restaurant_Detail/restaurant_detail.dart';
import 'package:yummy_bites/Store/restStore.dart';
import 'package:yummy_bites/Widget/ad_picture.dart';
import 'package:yummy_bites/Raw_Data/elements.dart';
import 'package:yummy_bites/Store/myStore.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var store = Provider.of<MyStore>(context);
    var restStore = Provider.of<RestStore>(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(229, 229, 229, 1.0),
      appBar: AppBar(
        actions: [
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 30),
                child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CartScreen(itemPrice: store.activeProduct!.price!.toDouble())));
                    },
                    icon: Icon(
                      Icons.add_shopping_cart_outlined,
                      size: 30,
                      color: Colors.black,
                    )),
              ),
              Positioned(
                  left: 37.0,
                  top: 10.0,
                  bottom: 20.0,
                  child: CircleAvatar(
                    radius: 15.0,
                    backgroundColor: Colors.deepPurpleAccent,
                    child: Text("${store.cart.length.toString()}"+"${restStore.cart.length.toString()}"),
                  ),
              )
            ],
          )
        ],
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Hi ! ",
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                "name  ",
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              AdPic(),
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
                height: 20,
              ),
              Container(
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
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
                            print(store.activeProduct);
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ItemDetailPage()  ));
                          },
                          child: Container(
                              width: 203,
                              height: 100,
                              color: Colors.white,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                        // borderRadius: BorderRadius.circular(10),
                                        shape: BoxShape.circle,
                                      ),
                                      width: 203,
                                      height: 118,
                                      child: Image.asset(
                                        store.product[index].image!,
                                        fit: BoxFit.cover,
                                      )),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    store.product[index].name.toString(),
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  AnimatedDefaultTextStyle(
                                    duration: Duration(milliseconds: 200),
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        foreground: Paint()),
                                    child: Text(
                                      "Rs.${store.product[index].price.toString()}",
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child:(!store.cart.contains(store.product[index]))? Consumer<MyStore>(
                                      builder: (context, myStore, child) =>
                                          InkWell(
                                              onTap: () {
                                                store.setActiveProducts =
                                                    (store.product[index]);

                                                store.addItemToCart(
                                                    store.activeProduct!);
                                                print(store.activeProduct!);
                                              },
                                              child: Container(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      width: 128,
                                                      height: 30.15,
                                                      decoration: BoxDecoration(
                                                        color: Colors.blue,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      child:Text(
                                                        "Add to cart",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                      ),
                                                    )),
                                    ):
                                    Center(
                                      child: Text("Added",
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                          color: Colors.black,
                                        )
                                      ),
                                      ),
                                    )
                                  )
                                ],
                              ),
                          ),
                        );
                      }
                      )
              ),
              SizedBox(height: 20,),

              Text("Choose  from \n Your favourite Restaurant!",
                style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    )
                ),
              ),
              SizedBox(height: 20,),
              Container(
                width: double.infinity,
                height: 200,

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20),

                          topRight: Radius.circular(20) ),

                      child: Container(
                        width: double.infinity,
                        height: 150,
                          child: Image.asset("asset/images/cafe.jpg",
                          fit: BoxFit.cover,
                          ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Restaurant",
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          )
                        ),
                        ),
                        IconButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ListOfRestaurant()));
                        },
                            icon: Icon(Icons.arrow_forward_ios,
                        size: 25,
                        ))
                      ],
                    )

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}






