

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yummy_bites/Colors/appColors.dart';
import 'package:yummy_bites/Store/myStore.dart';

// ignore: must_be_immutable
class QuantityIncDecButton extends StatelessWidget {
  QuantityIncDecButton({Key? key, required this.store, required this.order})
      : super(key: key);

  final MyStore store;
  int order;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, myStore, child) =>
        Container(
          margin: EdgeInsets.zero,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              color: AppColors.blue,
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(20),
                right: Radius.circular(20),
              )),
          width: 120,
          height: 35,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.remove,
                    color: Colors.white,
                  )),
              Text(
                order.toString(),
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
              IconButton(
                  onPressed: () {
                    store.orderIncrease(order);
                    store.updateQuantity();
                    print(store.orderIncrease(order));
                  },
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                  )
              ),
            ],
          ),
        ),
    );
  }

}