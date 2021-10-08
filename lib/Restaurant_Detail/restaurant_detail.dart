
import 'package:flutter/foundation.dart';

class RestaurantDetail extends ChangeNotifier{
  String ?restaurantName;


  String ?address;
  String ? imageProf;
  List<Category>?  category;


  RestaurantDetail({required this.restaurantName,required this.address, required this.imageProf,required this.category});
  RestaurantDetail ? _activeCafe;
  RestaurantDetail? get activeCafe=>_activeCafe;
  set setActiveCafe(RestaurantDetail cafe) {
    _activeCafe=cafe;
  }

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

