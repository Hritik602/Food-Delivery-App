import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_elegant_number_button/flutter_elegant_number_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:yummy_bites/Colors/appColors.dart';
import 'package:yummy_bites/Store/myStore.dart';
import 'package:yummy_bites/Store/restStore.dart';
import 'package:yummy_bites/Widget/QtyIncDecButton.dart';
import 'package:yummy_bites/Widget/simpleButton.dart';

// ignore: must_be_immutable
class CartScreen extends StatelessWidget {
   CartScreen({Key? key,required this.itemPrice}) : super(key: key);

  double itemPrice;

  @override
  Widget build(BuildContext context) {
    var store = Provider.of<MyStore>(context);
    var restStore = Provider.of<RestStore>(context, listen: false);
    return Scaffold(
      backgroundColor: Color.fromRGBO(229, 229, 229, 1.0),
        appBar: AppBar(
          title: Text("Cart Screen"),
        ),
        body:   Column(
          children: [
            Container(
              height:300,
              child:(store.cart.isEmpty)?Center(child: Text("Nothing here")): ListView.builder(
                  itemCount: store.cart.length,
                  itemBuilder: (context, i) {


                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),

                        width: 300,
                        height: 130,

                        decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 255, 255, 1.0),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(store.cart[i].name.toString(),
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.2,
                              )
                            ),
                            ),
                            Text("Price:             Rs.${store.cart[i].price!.toDouble()*store.cart[i].quantity!}",
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.2,
                                  )
                              ),
                            ),
                            Text(
                                  "Quantity :        ${store.cart[i].quantity.toString()}",
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.2,
                                  )
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [


                                IconButton(onPressed: (){
                                  store.removeItemFromCart(store.cart[i]);
                                },
                                    icon: Icon(Icons.delete,
                                    size: 35,
                                      color: Colors.red,
                                    )
                                )
                              ],
                            )

                          ],
                        ),
                      ),
                    );

                  }
              ),
            ),

                (restStore.cart.isEmpty)?Center(child: Text("Nothing here")): Consumer<RestStore>(builder: (context,restStore,child)=> Container(
                height: 300,
                child: ListView.separated(separatorBuilder: (context,index)=>Divider(thickness: 2.0,),
                  itemCount: restStore.cart.length,
                itemBuilder: (context,index){
                    return  Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),

                      width: 300,
                      height: 130,

                      decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 1.0),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(restStore.cart[index].category![index].variety![index].name.toString(),
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.2,
                                )
                            ),
                          ),
                          Text("Price:             Rs.${restStore.cart[index].category![index].variety![index].price.toDouble()*restStore.cart[index].category![index].variety![index].quantity}",
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.2,
                                )
                            ),
                          ),
                          Text(
                            "Quantity :        ${restStore.cart[index].category![index].variety![index].quantity.toString()}",
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.2,
                                )
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [


                              IconButton(onPressed: (){
                               restStore.removeItemFromCart(restStore.cart[index]);
                              },
                                  icon: Icon(Icons.delete,
                                    size: 35,
                                    color: Colors.red,
                                  )
                              )
                            ],
                          )

                        ],
                      ),
                    );
                }
                ),
              ),
            )

          ],
        )
    );
  }
}


// ignore: must_be_immutable
class OrderIncDec extends StatelessWidget {
   OrderIncDec({Key? key,required this.totalPrice}) : super(key: key);
  double totalPrice;
  @override
  Widget build(BuildContext context) {
    var store = Provider.of<MyStore>(context);
    return Consumer(
      builder: (context,myCart,child)=> ElegantNumberButton(
        buttonSizeHeight: 30.0,
        buttonSizeWidth: 30.0,
        minValue: 1,
        maxValue: 10,
        initialValue: store.activeProduct!.quantity!.toInt(),
        decimalPlaces: 0,
        onChanged: (num value) {
          totalPrice=(value*store.activeProduct!.price!.toDouble());
          store.activeProduct!.quantity=value.toInt();
          store.updateQuantity();
          store.totalPrice();
          print(totalPrice);
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class QntyIncDec extends StatelessWidget {
  QntyIncDec({Key? key,required this.totalPrice,required this.index}) : super(key: key);
  double totalPrice;
  int index;
  @override
  Widget build(BuildContext context) {
    var restStore = Provider.of<RestStore>(context);
    return Consumer(
      builder: (context,myCart,child)=> ElegantNumberButton(
        buttonSizeHeight: 30.0,
        buttonSizeWidth: 30.0,
        minValue: 1,
        maxValue: 10,
        initialValue: restStore.activeCafe!.category![index].variety![index].quantity.toInt(),
        decimalPlaces: 0,
        onChanged: (num value) {
          totalPrice=(value*restStore.activeCafe!.category![index].variety![index].price);
          restStore.activeCafe!.category![index].variety![index].quantity=value.toInt();
          restStore.updateQuantity(index);
          restStore.totalPrice(index);
          print(totalPrice);
        },
      ),
    );
  }
}


// ListTile(
// onLongPress: () {
// print("hello");
// },
// title: Text(store.cart[i].name.toString()),
// trailing: IconButton(
// onPressed: () {
// store.removeItemFromCart(store.cart[i]);
// },
// icon: Icon(Icons.remove),
// ),
// );