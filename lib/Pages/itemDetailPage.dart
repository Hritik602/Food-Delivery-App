import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_elegant_number_button/flutter_elegant_number_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:yummy_bites/Colors/appColors.dart';
import 'package:yummy_bites/Pages/cart_page.dart';
import 'package:yummy_bites/Store/myStore.dart';
import 'package:yummy_bites/Widget/simpleButton.dart';

class ItemDetailPage extends StatelessWidget {
  const ItemDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var store = Provider.of<MyStore>(context);
    var textStyle = TextStyle(
        fontSize: 25, fontWeight: FontWeight.w600, letterSpacing: 1.0);

    return Scaffold(
      bottomNavigationBar: (!store.cart.contains(store.activeProduct!)) ? Consumer(builder: (context, myStore, child)=> InkWell(
          onTap: (){
            store.addItemToCart(store.activeProduct!);
          },
          child: Row(
            children: [
              OrderIncDec(totalPrice: store.activeProduct!.price!),
              Button(
                store: store,
                text: "Add to Cart (Rs. ${store.activeProduct!.price})",
                width: 209,
                height: 49,
              ),
            ],
          ),
        ),
      ):InkWell(
        onTap: (){
         print( (!store.cart.contains(store.activeProduct!)));
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>CartScreen()));
        },
        child: Button(store: store, text:"Go to Cart", width: 209, height: 49
        ),
      ),
      appBar: AppBar(
        actions: [
          CircleAvatar(
            radius: 15.0,
            backgroundColor: Colors.deepPurpleAccent,
            child: Text(store.cart.length.toString()),
          ),
        ],
        title: buildText(
            name: "Yummy Bites",
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.w600),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      backgroundColor: Color.fromRGBO(250, 250, 250, 1.0),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Food pic at top
                FoodPic(store: store),

                SizedBox(
                  height: 20,
                ),

                // Name and price of food
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildText(
                        name: "${store.activeProduct!.name}",
                        fontSize: 34,
                        fontWeight: FontWeight.bold),
                    buildText(
                      name: "Rs.${store.activeProduct!.price.toString()}",
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: AppColors.blue,
                    ),
                  ],
                ),

                //Here Should be Name of Restaurant
                buildText(
                    name: 'Restaurant Name',
                    fontSize: 18,
                    fontWeight: FontWeight.bold),

                SizedBox(
                  height: 40,
                ),
                // will You add some extra fod
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildText(
                      name: " Add Extras",
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                    ),
                    Button(store: store, text: "Select", width: 109, height: 31)
                  ],
                ),

                SizedBox(
                  height: 30,
                ),

                // Ingredients of Food
                buildText(
                    name: "Ingredients",
                    fontSize: 27,
                    fontWeight: FontWeight.w700),

                SizedBox(
                  height: 20,
                ),

                //List of ingredients
                IngredientElements(),

                SizedBox(
                  height: 10,
                ),

                // Nutrients should be added Later
                Text(
                  "Nutrients",
                  style: GoogleFonts.poppins(textStyle: textStyle),
                ),

                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Text buildText(
      {required String name,
      required double fontSize,
      Color? color,
      FontWeight? fontWeight}) {
    return Text(name,
        style: GoogleFonts.poppins(
          textStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
          ),
        ));
  }
}

// Button


//Food picture
class FoodPic extends StatelessWidget {
  FoodPic({Key? key, required this.store}) : super(key: key);
  final MyStore store;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
        topRight: Radius.circular(20),
        bottomLeft: Radius.circular(20),
      )),
      width: MediaQuery.of(context).size.width,
      height: 270,
      child: Image.asset(
        store.activeProduct!.image.toString(),
        fit: BoxFit.cover,
      ),
    );
  }
}



class IngredientElements extends StatelessWidget {
  const IngredientElements({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) {
          return SizedBox(
            width: 20,
          );
        },
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
              padding: EdgeInsets.all(5.0),
              width: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Colors.lightBlueAccent),
              child: Column(
                children: [
                  Expanded(
                    child: Image.asset(
                      "asset/images/Ingredients_burger.jpg",
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                      child: Text(
                    "Bun",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )),
                  ))
                ],
              ));
        },
      ),
    );
  }
}
