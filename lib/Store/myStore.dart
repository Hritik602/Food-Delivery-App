


import 'package:flutter/material.dart';

import 'package:yummy_bites/FoodItem/foodItem.dart';

  class MyStore extends ChangeNotifier {
  List<FoodItem> _products = [];

  List<FoodItem> _cart = [];

  FoodItem ? _activeProducts;

  updateQuantity() {
  activeProduct!.quantity!;
  notifyListeners();
  }
  totalPrice(){
    var total=(activeProduct!.price!*activeProduct!.quantity!);
     // ignore: unnecessary_statements
     total;
    notifyListeners();
  }

  orderIncrease(int quantity){
    quantity++;
    print(quantity);
    notifyListeners();
  }
  orderDecrease(int quantity){
    quantity--;
    notifyListeners();
  }

  addItemToCart(FoodItem added) {
  _cart.add(added);
  notifyListeners();
  }

  removeItemFromCart(FoodItem removed) {
  _cart.remove(removed);
  notifyListeners();
  }

  MyStore() {
  _products = [
    FoodItem( quantity: 1, name: "Pizza", price: 1000.0, image: "asset/images/Pizza.jpg"),
    FoodItem( quantity: 1, name: "Burger", price: 240.0, image: "asset/images/Burger.jpg"),
    FoodItem( quantity: 1, name: "Burger ", price: 122.0, image: "asset/images/Burger.jpg",),



    FoodItem( quantity: 1, name: "Burger", price: 199.0, image: "asset/images/Burger.jpg"),
    FoodItem( quantity: 1, name: "Pasta", price: 500.0, image: "asset/images/Pasta.jpg"),
    FoodItem( quantity: 1, name: "Sandwich", price: 400.0, image: "asset/images/Sandwich.jpg"),

  ];

  notifyListeners();
  }
  List<FoodItem> get product => _products;
  List<FoodItem> get cart => _cart;

  FoodItem? get activeProduct => _activeProducts;

  // ignore: non_constant_identifier_names
  set setActiveProducts(FoodItem p) {
  _activeProducts = p;
  }
  }

