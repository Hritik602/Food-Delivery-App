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

  updateQuantity(int index) {
    // ignore: unnecessary_statements
    activeCafe!.category![index].variety![index].quantity=1;
    notifyListeners();
  }
  totalPrice(int index){
    var total=(activeCafe!.category![index].variety![index].price*activeCafe!.category![index].variety![index].quantity);
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

       category:
       [
         Category(
             name: "Pizza",
             variety: [
               Variety(id: 1,name:"Cheese Pizza" ,quantity:1 ,price:150 ),
               Variety(id: 2, name: "Veg Pizza", quantity: 1, price: 200)
             ],
         ),
         Category(name: "Burger",
             variety: [
           Variety(id: 1,  name: "Burger", quantity: 1, price:200)
         ]
         )
       ],
    ),
    RestaurantDetail(
        restaurantName: "The kFC ",
        address: "Biratnagar",
        imageProf: "asset/images/Restaurant 2.jpg",
      category:
      [
        Category(
          name: "Mo:Mo",
          variety: [
            Variety(id: 1,name:"Cheese Pizza" ,quantity:1 ,price:150 ),
            Variety(id: 2, name: "Veg Pizza", quantity: 1, price: 200)
          ],
        ),
        Category(name: "Sandwich",
            variety: [
              Variety(id: 1,  name: "Burger", quantity: 1, price:200)
            ])
      ],

    ),
    RestaurantDetail(
        restaurantName: " ABC",
        address: "Biratnagar",
        imageProf: "asset/images/Restaurant 2.jpg",
      category:
      [
        Category(
          name: "Pizza",
          variety: [
            Variety(id: 1,name:"Cheese Pizza" ,quantity:1 ,price:150 ),
            Variety(id: 2, name: "Veg Pizza", quantity: 1, price: 200)
          ],
        ),
        Category(name: "Burger",
            variety: [
              Variety(id: 1,  name: "Burger", quantity: 1, price:200)
            ])
      ],

    ),
    RestaurantDetail(
        restaurantName: " ABC",
        address: "Biratnagar",
        imageProf: "asset/images/Restaurant 2.jpg",
      category:
      [
        Category(
          name: "Pizza",
          variety: [
            Variety(id: 1,name:"Cheese Pizza" ,quantity:1 ,price:150 ),
            Variety(id: 2, name: "Veg Pizza", quantity: 1, price: 200)
          ],
        ),
        Category(name: "Burger",
            variety: [
              Variety(id: 1,  name: "Burger", quantity: 1, price:200)
            ])
      ],
    ),
    RestaurantDetail(
        restaurantName: " The XYZ",
        address: "Biratnagar",
        imageProf: "asset/images/Restaurant 2.jpg",
      category:
      [
        Category(
          name: "Pizza",
          variety: [
            Variety(id: 1,name:"Cheese Pizza" ,quantity:1 ,price:150 ),
            Variety(id: 2, name: "Veg Pizza", quantity: 1, price: 200)
          ],
        ),
        Category(name: "Burger",
            variety: [
              Variety(id: 1,  name: "Burger", quantity: 1, price:200)
            ])
      ],
    ),
    RestaurantDetail(
      restaurantName: " XYz",
      address: "Biratnagar",
      imageProf: "asset/images/Restaurant 2.jpg",
      category:
      [
        Category(
          name: "Pizza",
          variety: [
            Variety(id: 1,name:"Cheese Pizza" ,quantity:1 ,price:150 ),
            Variety(id: 2, name: "Veg Pizza", quantity: 1, price: 200)
          ],
        ),
        Category(name: "Burger",
            variety: [
              Variety(id: 1,  name: "Burger", quantity: 1, price:200)
            ])
      ],
    )

  ];
  notifyListeners();
}
}