

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:yummy_bites/Colors/appColors.dart';
import 'package:yummy_bites/List_of_Restaurant/individual_cafe_detail.dart';
import 'package:yummy_bites/Restaurant_Detail/restaurant_detail.dart';
import 'package:yummy_bites/Store/restStore.dart';

class ListOfRestaurant extends StatelessWidget {
  const ListOfRestaurant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var restStore = Provider.of<RestStore>(context,listen: false);
    Size size= MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(8.0),
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: ListView.separated(
            separatorBuilder: (context,index)=>Divider(thickness: 2.0,),
            itemCount: restStore.restDetail.length,
            itemBuilder: (context,index){
              return InkWell(
                onTap: (){
                  // print(restStore.restaurantName);
                  // print(restStore.activeCafe);
                  restStore.setActiveCafe=(restStore.restDetail[index]);

                  Navigator.push(context, MaterialPageRoute(builder: (context)=>IndividualCafe(index:index)));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white.withRed(225),
                  ),
                  width: double.infinity,
                  padding: EdgeInsets.all(3.0),

                  height: 110,
                  child: Row(
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        child: Image.asset(restStore.restDetail[index].imageProf.toString())
                      ),
                      VerticalDivider(thickness: 4.0,),
                      Container(
                        width: 240,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                           BuildText(text: restStore.restDetail[index].restaurantName.toString(), iconSize: 20),
                            BuildText(text: restStore.restDetail[index].address.toString(), iconSize:18),
                            BuildText(text: "Delivery Hour: \n 12:00PM-8:00PM"  , iconSize:15)
                          ],
                        ),
                      ),

                      BuildText(text: index.toString(), iconSize: 17)

                    ],
                  ),
                ),
              );
            },
        ),
      )
    );
  }

  // ignore: non_constant_identifier_names

}
// ignore: must_be_immutable
class BuildText extends StatelessWidget {
   BuildText({Key? key,required this.text,required this.iconSize}) : super(key: key);
  String text;
  double iconSize;

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: GoogleFonts.poppins(
          textStyle: TextStyle(
              fontSize: iconSize,
              fontWeight: FontWeight.w600
          )
      ),
    );
  }
}





