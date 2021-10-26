import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_elegant_number_button/flutter_elegant_number_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:yummy_bites/Pages/my%20cart.dart';
import 'package:yummy_bites/Store/myStore.dart';
import 'package:yummy_bites/Store/restStore.dart';


// ignore: must_be_immutable
class CartScreen extends StatelessWidget {
  CartScreen({Key? key, }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    var store = Provider.of<MyStore>(context);
    var restStore = Provider.of<RestStore>(context, listen: false);
    return Scaffold(
        backgroundColor: Color.fromRGBO(225, 225, 225,1),
        appBar:  AppBar(
          elevation: 5.0,
          centerTitle: true,
          title: Text("My Cart",
            style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Colors.black,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w600,
                )
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [

                (restStore.cart.isEmpty)
                    ? Center(child: Text("Nothing here"))
                    : Consumer<RestStore>(
                        builder: (context, restStore, child) => Container(
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5.0),
                           height: MediaQuery.of(context).size.height*0.5,
                            child: ListView.separated(
                                separatorBuilder: (context, index) => Divider(
                                      thickness: 5.0,
                                  color: Colors.black54,
                                  indent: 15,
                                  endIndent: 15,
                                  height: 20,
                                    ),
                                itemCount: restStore.cart.length,
                                itemBuilder: (context, index) {
                                  print(restStore.cart[index]);


                                  return Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.white,
                                          offset: const Offset(1.0, 1.0),
                                          blurRadius: 1.0,
                                          spreadRadius: 0.0,
                                        ),
                                      ]
                                    ),
                                    child: ListTile(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MyCart(restStore: restStore,cartIndex: index,)));
                                      },
                                      leading: CircleAvatar(
                                        radius: 40.0,
                                        backgroundImage: AssetImage(restStore.cart[index].imageProf.toString()),
                                      ),
                                      title:Text(restStore.cart[index].restaurantName.toString(),
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(fontSize: 40),
                                        ),),
                                      subtitle: Text(restStore.cart[index].address.toString(),
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(fontSize: 20),
                                        ),),

                                    ),
                                  );
                                }
                                )
                        ),
                      ),
                Container(
                  height: MediaQuery.of(context).size.height*0.5,
                  child: (store.cart.isEmpty)
                      ? Center(child: Text("Nothing here"))
                      : ListView.builder(
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
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      store.cart[i].name.toString(),
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 1.2,
                                      )),
                                    ),
                                    Text(
                                      "Price:             Rs.${store.cart[i].price!.toDouble() * store.cart[i].quantity!}",
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 1.2,
                                      )),
                                    ),
                                    Text(
                                      "Quantity :        ${store.cart[i].quantity.toString()}",
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 1.2,
                                      )),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              store.removeItemFromCart(
                                                  store.cart[i]);
                                            },
                                            icon: Icon(
                                              Icons.delete,
                                              size: 35,
                                              color: Colors.red,
                                            ))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          }
                          ),
                ),
              ],
            ),
          ),
        )
    );
  }
}

class ItemInCart extends StatelessWidget {
  const ItemInCart(
      {Key? key,
      required this.restStore,
      required this.cartIndex,
      required this.varietyIndex,
      required this.cateogoryIndex})
      : super(key: key);

  final RestStore restStore;
  final int cartIndex;
  final int cateogoryIndex;
  final int varietyIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 1.0),
      width: 300,
      height: 130,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            offset: const Offset(0.0, 0.0),
            blurRadius: 1.0,
            spreadRadius: 1.0,
          ),
        ],
          // color: Color.fromRGBO(255, 255, 255, 1.0),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            restStore.cart[cartIndex].category![cateogoryIndex]
                .variety![varietyIndex].name
                .toString(),
            style: GoogleFonts.poppins(
                textStyle: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.2,
            )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Quantity   :${restStore.cart[cartIndex].category![cateogoryIndex].variety![varietyIndex].quantity.toString()}",
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.2,
                    )),
              ),
              Text(
                "Rs.${restStore.cart[cartIndex].category![cateogoryIndex].variety![varietyIndex].price.toDouble() * restStore.cart[cartIndex].category![cateogoryIndex].variety![varietyIndex].quantity}",
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.2,
                )),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    restStore.removeItemFromCart(restStore.cart[cartIndex]);
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.delete,
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
}

// ignore: must_be_immutable
class OrderIncDec extends StatelessWidget {
  OrderIncDec({Key? key, required this.totalPrice}) : super(key: key);
  double totalPrice;
  @override
  Widget build(BuildContext context) {
    var store = Provider.of<MyStore>(context);
    return Consumer(
      builder: (context, myCart, child) => ElegantNumberButton(
        buttonSizeHeight: 30.0,
        buttonSizeWidth: 30.0,
        minValue: 1,
        maxValue: 10,
        initialValue: store.activeProduct!.quantity!.toInt(),
        decimalPlaces: 0,
        onChanged: (num value) {
          totalPrice = (value * store.activeProduct!.price!.toDouble());
          store.activeProduct!.quantity = value.toInt();
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
  QntyIncDec(
      {Key? key,
      required this.totalPrice,
      required this.categoryIndex,
      required this.varietyindex})
      : super(key: key);
  double totalPrice;
  int categoryIndex;
  int varietyindex;
  @override
  Widget build(BuildContext context) {
    var restStore = Provider.of<RestStore>(context);
    return Consumer(
      builder: (context, myCart, child) => ElegantNumberButton(
        color: Colors.red,
        textStyle: TextStyle(fontSize: 20, color: Colors.red),
        buttonSizeHeight: 40.0,
        buttonSizeWidth: 60.0,
        minValue: 1,
        maxValue: 10,
        initialValue: restStore.activeCafe!.category![categoryIndex]
            .variety![varietyindex].quantity
            .toInt(),
        decimalPlaces: 0,
        onChanged: (num value) {
          totalPrice = (value *
              restStore.activeCafe!.category![categoryIndex]
                  .variety![varietyindex].price);
          restStore.activeCafe!.category![categoryIndex].variety![varietyindex]
              .quantity = value.toInt();
          restStore.updateQuantity(varietyIndex: varietyindex, catIndex: categoryIndex);
          restStore.totalPrice(varietyIndex: varietyindex, catIndex: categoryIndex);
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
