import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:yummy_bites/FoodItem/foodItem.dart';
import 'package:yummy_bites/Restaurant_Detail/restaurant_detail.dart';

class RestStore extends ChangeNotifier{

  List<RestaurantDetail> _restDetail=[];
  List<RestaurantDetail> _cart = [];
  RestaurantDetail ? _activeCafe;
  RestaurantDetail? get activeCafe=>_activeCafe;
  List<RestaurantDetail> get product => _restDetail;
  List<RestaurantDetail> get cart => _cart;
  set setActiveCafe(RestaurantDetail cafe) {
    _activeCafe=cafe;

  }
  addItemToCart(RestaurantDetail added) {
    _cart.add(added);
  }
  removeItemFromCart(RestaurantDetail removed) {
    _cart.remove(removed);
    notifyListeners();
  }

  updateQuantity() {
    // ignore: unnecessary_statements
    activeCafe!.qntyofItem=1;
    notifyListeners();
  }
  totalPrice(){
    var total=(activeCafe!.price!*activeCafe!.qntyofItem!);
    // ignore: unnecessary_statements
    total;
    notifyListeners();
  }

  List<RestaurantDetail> get restDetail=>_restDetail;
RestStore(){
    _restDetail=[
    RestaurantDetail(
        restaurantName: " Pizza Hut",
        address: "Biratnagar",
        imageProf: "asset/images/Restaurant 2.jpg",

        category: ['Mo:Mo',"chicken","Coffee","Tea","Vag"],
        items:[
          {"Cheese Pizza ":100.0},
          {"Veggie Pizza":100.0},
          {"Pepperoni Pizza":100.0},
          {"Meat Pizza":100.0},
          {"Mixed Veg Pizza":100.0},
          {"Chicken Pizza":100.0},
          {"Mixed Pizza":100.0},
        ],
      price: 100.0, qntyofItem: 1,
    ),
    RestaurantDetail(
        restaurantName: "The kFC ",
        address: "Biratnagar",
        imageProf: "asset/images/Restaurant 2.jpg",
        category:['Mo:Mo',"chicken","Coffee","Tea","Vag"],
        items:[
          {"Cheese ":100.0},
          {"Cheese Pizza":100.0},
          {"Cheese Pizza":100.0},
          {"Cheese Pizza":100.0},
          {"Cheese Pizza":100.0},
          {"Cheese Pizza":100.0},
          {"Cheese Pizza":100.0},
        ],
      price: 100.0, qntyofItem: 1,

    ),
    RestaurantDetail(
        restaurantName: " ABC",
        address: "Biratnagar",
        imageProf: "asset/images/Restaurant 2.jpg",
        category: ['Mo:Mo',"chicken","Coffee","Tea","Vag"],
        items:[
          {"Cheese ":100.0},
          {"Cheese Pizza":100.0},
          {"Cheese Pizza":100.0},
          {"Cheese Pizza":100.0},
          {"Cheese Pizza":100.0},
          {"Cheese Pizza":100.0},
          {"Cheese Pizza":100.0},
        ],
      price: 100.0, qntyofItem: 1,

    ),
    RestaurantDetail(
        restaurantName: " ABC",
        address: "Biratnagar",
        imageProf: "asset/images/Restaurant 2.jpg",
        category: ['Mo:Mo',"chicken","Coffee","Tea","Vag"],
        items:[
          {"Cheese ":100.0},
          {"Cheese Pizza":100.0},
          {"Cheese Pizza":100.0},
          {"Cheese Pizza":100.0},
          {"Cheese Pizza":100.0},
          {"Cheese Pizza":100.0},
          {"Cheese Pizza":100.0},
        ],
      price: 100.0, qntyofItem: 1,
    ),
    RestaurantDetail(
        restaurantName: " The XYZ",
        address: "Biratnagar",
        imageProf: "asset/images/Restaurant 2.jpg",
        category: ['Mo:Mo',"chicken","Coffee","Tea","Vag"],
        items:[
          {"Cheese ":100.0},
          {"Cheese Pizza":100.0},
          {"Cheese Pizza":100.0},
          {"Cheese Pizza":100.0},
          {"Cheese Pizza":100.0},
          {"Cheese Pizza":100.0},
          {"Cheese Pizza":100.0},
        ],
      price: 100.0, qntyofItem: 1,
    ),
    RestaurantDetail(
      restaurantName: " XYz",
      address: "Biratnagar",
      imageProf: "asset/images/Restaurant 2.jpg",
        category:['Mo:Mo',"chicken","Coffee","Tea","Vag"],
        items:[
          {"Cheese ":100.0},
          {"Cheese Pizza":100.0},
          {"Cheese Pizza":100.0},
          {"Cheese Pizza":100.0},
          {"Cheese Pizza":100.0},
          {"Cheese Pizza":100.0},
          {"Cheese Pizza":100.0},
        ],
      price: 100.0, qntyofItem: 1,
    )

  ];
  notifyListeners();
}
}