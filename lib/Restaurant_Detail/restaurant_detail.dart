import 'package:flutter/foundation.dart';

class RestaurantDetail  {
  String? restaurantName;

  String? address;
  String? imageProf;
  List<Category>? category;

  RestaurantDetail(
      {required this.restaurantName,
      required this.address,
      required this.imageProf,
      required this.category});
}

class Category {
  int? id;
  String? name;
  List<Variety>? variety;
  Category({
    this.id,
    required this.name,
    required this.variety,
  });
}

class Variety {
  int id;
  String name;
  int quantity;
  double price;
  Variety({
    required this.id,
    required this.name,
    required this.quantity,
    required this.price,
  });
}
