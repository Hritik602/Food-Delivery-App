import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:yummy_bites/Pages/cart_page.dart';
import 'package:yummy_bites/Restaurant_Detail/restaurant_detail.dart';
import 'package:yummy_bites/Store/restStore.dart';

// ignore: must_be_immutable
class CustomTabbar extends StatelessWidget {
  CustomTabbar({Key? key, required this.restStore, required this.index})
      : super(key: key);

  RestStore restStore;
  int index;

  @override
  Widget build(BuildContext context) {
    var tab = Provider.of<CustomeTab>(context);
    return InkWell(
      onTap: () {
        tab.setCurrentIndex =index;
        tab.changeTab(tab.currentIndex);
        tab.setPageNum =tab.currentIndex;
        tab.changePage(tab.currentIndex);
        tab.pageController.animateToPage(tab.pageNum, duration: Duration(milliseconds: 500), curve: Curves.bounceIn);
        print(" tab.pagenum:${tab.pageNum}");
        print("Index :$index");
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 1000),
        padding: EdgeInsets.symmetric(vertical:tab.currentIndex == index ? 12.0:15.0,
            horizontal:tab.currentIndex == index ? 20.0:15.0),
        decoration: BoxDecoration(
          color: tab.currentIndex == index ? Colors.blue : Colors.transparent,
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Text(
          restStore.activeCafe!.category![index].name.toString(),
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ListOfVariety extends StatefulWidget {
  ListOfVariety(
      {Key? key,
      required this.restStore})
      : super(key: key);

  RestStore restStore;

  @override
  _ListOfVarietyState createState() => _ListOfVarietyState();
}

class _ListOfVarietyState extends State<ListOfVariety> {
  @override
  Widget build(BuildContext context) {
    var tab = Provider.of<CustomeTab>(context);
    return  PageView.builder(
        onPageChanged:  (int num){
          tab.setCurrentIndex=(num);
          print(num);

        },

        controller: tab.pageController,
        itemCount: widget.restStore.activeCafe!.category!.length,
        itemBuilder: (context ,index){
          return FoodListIndCafe(restStore: widget.restStore, pageIndex: index);
        }
    );
  }
}

// ignore: must_be_immutable
class FoodListIndCafe extends StatelessWidget {
   FoodListIndCafe({Key? key,required this.restStore,required this.pageIndex}) : super(key: key);

  RestStore restStore;
  int pageIndex;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context,i)=>Divider(),
      itemCount: restStore.activeCafe!.category![pageIndex].variety!.length,
      itemBuilder: (context , j   ){

        return ListTile(
          onTap: (){

            showModalBottomSheet(
                context: context, builder: (context){
                  return Container(
                    padding: EdgeInsets.all(8.0),
                    height: 160,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(restStore.activeCafe!.category![pageIndex].variety![j].name,
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,

                                )
                              ),
                            ),
                            QntyIncDec(totalPrice: restStore.activeCafe!.category![pageIndex].variety![j].price,
                              categoryIndex: pageIndex,
                              varietyindex: j,

                            ),
                          ],
                        ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(" \t \t Rs.${restStore.activeCafe!.category![pageIndex].variety![j].price.toString()}",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,

                            ))

                        ),
                    ),
                        SizedBox(height: 10,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child : Container(
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(20),
                                ),

                                width: 150,
                                height:50,
                                child:Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(Icons.cancel_presentation,color: Colors.white,),
                                    Text("Cancel",style: TextStyle(letterSpacing:2.0,color: Colors.white),)

                                  ],
                                )
                              ),
                            ),
                            InkWell(
                              onTap: (){

                                Variety cartItem= restStore.activeCafe!.category![pageIndex].variety![j];
                                Category cartCat=Category(name: restStore.activeCafe!.category![pageIndex].name, variety: [cartItem]);
                                RestaurantDetail restDetail=RestaurantDetail(category: [cartCat],
                                  restaurantName: restStore.activeCafe!.restaurantName,
                                  address: restStore.activeCafe!.address, imageProf: restStore.activeCafe!.imageProf,
                                );

                               //  restStore.setActiveCafe=restStore.activeCafe!;
                                // ignore: unnecessary_statements
                                (restStore.cart.contains(restDetail )) ? null:restStore.addItemToCart(
                                    // ignore: unnecessary_statements
                                    restDetail);
                                print(restStore.activeCafe!);
                                Timer(Duration(milliseconds: 500),
                                        () =>
                                        Navigator.pop(context)
                                );
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(20),
                                  ),

                                  width: 150,
                                  height:50,
                                  child:Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Icon(Icons.shopping_basket,color: Colors.white,),
                                      Text("Add To Cart",style: TextStyle(letterSpacing:2.0,color: Colors.white),)

                                    ],
                                  )
                              ),
                            )
                          ],
                        ),
                      ],

                    ),
                  );
            }
            );

            print(restStore.activeCafe!.category![pageIndex].variety![j].name.toString());
          },
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
          title: Text(restStore.activeCafe!.category![pageIndex].variety![j].name.toString(),
          style: Theme.of(context).textTheme.headline5,
          ),
          trailing: Text("Rs.${restStore.activeCafe!.category![pageIndex].variety![j].price.toString()}",
          style: Theme.of(context).textTheme.button,
          ),
        );
      },

    );
  }
}


class CustomeTab extends ChangeNotifier {
  PageController pageController =PageController(initialPage: 0);

  PageController  get pageCnt => pageController;

  set setPageCnt(pageCont) {
    pageController = pageCont;
    notifyListeners();
  }

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  set setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  changeTab(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  int _pageNum =0;
  int get pageNum => _pageNum;

  set setPageNum(int index) {
    _pageNum = index;
    notifyListeners();
  }

  changePage(int pageIndex) {
    _currentIndex = pageIndex;
    pageController.animateToPage(_pageNum,
        duration: Duration(milliseconds: 500),
        curve: Curves.fastLinearToSlowEaseIn);
    notifyListeners();
  }
}
