import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_elegant_number_button/flutter_elegant_number_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:yummy_bites/Colors/appColors.dart';
import 'package:yummy_bites/List_of_Restaurant/menu_items.dart';
import 'package:yummy_bites/Pages/cart_page.dart';
import 'package:yummy_bites/Restaurant_Detail/restaurant_detail.dart';
import 'package:yummy_bites/Store/restStore.dart';

class IndividualCafe extends StatefulWidget {
   IndividualCafe({Key? key, required int index}) : super(key: key);

  @override
  _IndividualCafeState createState() => _IndividualCafeState();
}

class _IndividualCafeState extends State<IndividualCafe> with SingleTickerProviderStateMixin {
  TabController ? _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 7, vsync: this);
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
                  children:[
                    SingleChildScrollView(
                      child: Column(
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width,
                            height: 220,
                            child: Image.asset("asset/images/best-delicious-food.jpg",
                              fit: BoxFit.fill,
                            ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 85),
                          child: Text(restStore.activeCafe!.restaurantName.toString()
                            ,style: TextStyle(fontSize: 45),),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.location_on,color: Colors.redAccent,),
                            Text(restStore.activeCafe!.address.toString(),
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: Colors.red,
                                fontSize: 18,
                              )
                            ),
                            )
                          ],
                        ),
                        SizedBox(height: 20,),

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
                          thickness:5.0 ,
                        endIndent: 20,
                        indent: 20,
                          color: Colors.black38,
                        ),
                        Text("Menu",
                        style:GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                          )
                        ),
                        ),
                        SizedBox(height: 10,),
                        // Container(
                        //   width: MediaQuery.of(context).size.width,
                        //   height: 185,
                        //   child: ListView.separated(
                        //     scrollDirection: Axis.horizontal,
                        //       shrinkWrap: true,
                        //
                        //       separatorBuilder: (context,index)=>SizedBox(width: 10,),
                        //       itemCount: 6,
                        //     itemBuilder: (context,index){
                        //         return Container(
                        //           width: 150,
                        //           decoration: BoxDecoration(
                        //             color: AppColors.blue,
                        //             borderRadius: BorderRadius.only(
                        //               topLeft: Radius.circular(30),
                        //               topRight: Radius.circular(30),
                        //               bottomRight: Radius.circular(30)
                        //             ),
                        //           ),
                        //
                        //
                        //           child: Column(
                        //             children: [
                        //               ClipRRect(
                        //
                        //                 child: Container(
                        //                   height: 100,
                        //                   child: Image.asset("asset/images/coffee.jpg"),
                        //                 ),
                        //                 borderRadius: BorderRadius.only(
                        //                   topLeft: Radius.circular(30),
                        //                   topRight: Radius.circular(30),
                        //                 ),
                        //               ),
                        //             ],
                        //           )
                        //         );
                        //     },
                        //   )
                        // )
                        SizedBox(height: 50,
                          child:TabBar(
                            isScrollable: true,

                            unselectedLabelColor: Colors.red,
                            controller: _tabController,
                            tabs:[
                                  Tab(child: Text("Pizza",style: Theme.of(context).textTheme.headline5,),),
                                  Tab(child: Text("Burger",style: Theme.of(context).textTheme.headline5,),),
                                  Tab(child: Text("Chicken",style: Theme.of(context).textTheme.headline5,),),
                                  Tab(child: Text("Veg",style: Theme.of(context).textTheme.headline5,),),
                                  Tab(child: Text("Pizza",style: Theme.of(context).textTheme.headline5,),),
                                  Tab(child: Text("Pizza",style: Theme.of(context).textTheme.headline5,),),
                                  Tab(child: Text("Pizza",style: Theme.of(context).textTheme.headline5,),)
                                ],
                              ),
                            ),
                        SizedBox(
                          height: 100,
                          child: TabBarView(
                              controller: _tabController,
                                children: [
                                     MenuList(totalPrice: restStore.activeCafe!.price!,
                                     ),
                                      MenuList(totalPrice: restStore.activeCafe!.price!,
                                      ),
                                      MenuList(totalPrice: restStore.activeCafe!.price!,
                                      ),
                                      MenuList(totalPrice: restStore.activeCafe!.price!,
                                      ),
                                      MenuList(totalPrice: restStore.activeCafe!.price!,
                                      ),
                                      MenuList(totalPrice: restStore.activeCafe!.price!,
                                      ),
                                      MenuList(totalPrice: restStore.activeCafe!.price!,
                                      ),


                                ]
                            ),
                        )


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
                          child:IconButton(
                            onPressed: (){
                              Navigator.pop(context);
                            },
                            icon:Icon(Icons.arrow_back) ,
                          ) ,

                        )
                    ),
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
                        )
                    )


            ],
                ),
    ),
      ),
    ));
  }
}

class First extends StatelessWidget {
  const First({Key? key, required RestStore store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
    );
  }
}

// ignore: must_be_immutable
class MenuList extends StatelessWidget {
   MenuList({Key? key,required this.totalPrice}) : super(key: key);

   double totalPrice;



  @override
   Widget build(BuildContext context) {

    var restStore = Provider.of<RestStore>(context, listen: false);
    return  ListView.builder(
      scrollDirection: Axis.vertical,
        itemCount:7,
        itemBuilder: (context,index){
          return ListTile(
              onTap: (){
                 showDialog(
                    context: context, builder: (context)=>AlertDialog(
                   backgroundColor: AppColors.blue,
                  actions: [
                    Column(
                      children: [
                        Text(restStore.activeCafe!.items![index].keys.toString()),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            QntyIncDec(totalPrice: restStore.activeCafe!.price!.toDouble()),
                            TextButton(
                                onPressed: (){
                                  restStore.setActiveCafe=restStore.restDetail[index];
                                  restStore.addItemToCart(restStore.activeCafe!);
                                  print(restStore.activeCafe!.items![index].keys);
                                  Navigator.pop(context);
                                },
                                child: Text("Add To Cart") ),
                          ],
                        ),

                      ],
                    ),

                  ],
                )
                );

              },
              title: Text(restStore.activeCafe!.items![index].keys.toString(),
              style: Theme.of(context).textTheme.headline6,
              ),
              trailing: Text(
                "Rs ${restStore.activeCafe!.items![index].values.toString() }/-",
                style: Theme.of(context).textTheme.headline6,
              ),
            );
        }
    );
  }
}




// ignore: camel_case_types, must_be_immutable
class Cafe_facility extends StatelessWidget {
   Cafe_facility({
    Key? key,required this.text,required this.icon
  }) : super(key: key);
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
          style:GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 15,
            )
          )
          )
        ],
      ),
    );
  }
}
