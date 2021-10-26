import 'package:flutter/cupertino.dart';
import 'package:yummy_bites/Restaurant_Detail/restaurant_detail.dart';

class RestStore extends ChangeNotifier{

  List<RestaurantDetail> _restDetail=[];
  List<RestaurantDetail> _cart = [];
  RestaurantDetail ? _activeCafe;
  RestaurantDetail? get activeCafe=>_activeCafe;
  List<RestaurantDetail> get detail => _restDetail;
  List<RestaurantDetail> get cart => _cart;
  set setActiveCafe(RestaurantDetail cafe) {
    _activeCafe=cafe;

  }
  addItemToCart(RestaurantDetail added ) {
    if(_cart.contains(added)){
    // ignore: unnecessary_statements

    }
    _cart.add(added);
    notifyListeners();
  }
  removeItemFromCart(RestaurantDetail removed) {
    _cart.remove(removed);
    notifyListeners();
  }

  updateQuantity({required int catIndex, required int varietyIndex}) {
    // ignore: unnecessary_statements
    activeCafe!.category![catIndex].variety![varietyIndex].quantity;
    notifyListeners();
  }
  totalPrice({required int catIndex, required int varietyIndex}){
    var total=(activeCafe!.category![catIndex].variety![varietyIndex].price*activeCafe!.category![catIndex].variety![varietyIndex].quantity);
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
            Variety(id: 1,name:"Chicken Mo:MO" ,quantity:1 ,price:150 ),
            Variety(id: 2, name: "Veg Mo:Mo", quantity: 1, price: 200)
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