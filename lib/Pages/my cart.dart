import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yummy_bites/Login_Pages/to_login_page.dart';
import 'package:yummy_bites/Pages/cart_page.dart';
import 'package:yummy_bites/Store/restStore.dart';

class MyCart extends StatelessWidget {
  const MyCart({Key? key, required this.restStore, required this.cartIndex}) : super(key: key);

  final RestStore restStore;
  final int cartIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(225, 225, 225,1),
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back,color: Colors.black,)),
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
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(5.0),
            decoration: BoxDecoration(

            ),

            width: double.infinity,
            height: MediaQuery.of(context).size.height*0.5,
            child: ListView.builder(
              itemCount:restStore.cart[cartIndex].category!.length,
                itemBuilder: (context,catIndex){
                return SizedBox(
                  height: 300,
                  child: ListView.builder(
                      itemCount: restStore.cart[cartIndex].category![catIndex].variety!.length,
                      itemBuilder: (context,varIndex){
                        return ItemInCart(restStore: restStore, cartIndex: cartIndex, varietyIndex: varIndex, cateogoryIndex: catIndex);
                      }
                  ),
                );
                }
            ),
          ),
          ItemBill(restStore:restStore),
          SizedBox(
            height: 20,
          ),
          ContinueButton(),
        ],
      ),
    );
  }
}

class ContinueButton extends StatelessWidget {
  const ContinueButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        ScaffoldMessenger.of(context).showSnackBar( SnackBar(
          content: Text("Sorry It Is Disabled !",
          ),
          backgroundColor: Colors.redAccent,
        )
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Container(
          width: double.infinity,
          height: 70,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.red.shade400,
                    Colors.red.shade700,

                  ]
              )
          ),
          child: Center(
            child: RichText(
              text: TextSpan(
                text: "Continue",
                style:GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    )
                ) ,
              ),
            ),

          ),
        ),



      ),
    );
  }
}


// ignore: must_be_immutable
class ItemBill extends StatelessWidget {
  ItemBill({Key? key ,required this.restStore}) : super(key: key);

  RestStore restStore;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12,vertical: 7),
      height: 155,
      width: 370,
      color: Color.fromRGBO(14, 118, 185, 0.79),
      child: Column(
        children: [
          Text("It is only for demo ,Its functionality is disabled",
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              color: Colors.yellow
            )
          ),
          ),
          BillCharges("Total Price","Rs.0"),
          BillCharges("Tax(10%)", "Rs.0"),
          BillCharges("Delivery Fee", "Rs.50"),
          Divider(
            height: 10,
            thickness: 3.0,
            color: Colors.black,
          ),
          BillCharges("Grand Total", "Rs.300"),
        ],
      )
    );
  }
  // ignore: non_constant_identifier_names
  Row BillCharges (String firstText,String secText){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(firstText,
        style:GoogleFonts.poppins(
          textStyle: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18
          )
        )
        ),
        Text(secText,
        style:GoogleFonts.poppins(
    textStyle: TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 18
    )
        )
        )
      ],
    );
  }
}

