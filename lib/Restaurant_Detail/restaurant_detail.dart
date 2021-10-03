
import 'package:flutter/foundation.dart';

class RestaurantDetail extends ChangeNotifier{
  String ?restaurantName;

  int ?qntyofItem;
  String ?address;
  String ? imageProf;
  List<String>? category;
  List<Map<String,double>> ? items;
  double ?price;


  RestaurantDetail({required this.price,required this.qntyofItem,required this.restaurantName,required this.address, required this.imageProf,required this.category,required this.items});
  RestaurantDetail ? _activeCafe;
  RestaurantDetail? get activeCafe=>_activeCafe;
  set setActiveCafe(RestaurantDetail cafe) {
    _activeCafe=cafe;
  }

  }
