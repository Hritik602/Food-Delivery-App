

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yummy_bites/Login_Pages/to_login_page.dart';
import 'package:yummy_bites/Pages/home_page.dart';
import 'package:yummy_bites/Pages/splashScreen.dart';

import 'package:yummy_bites/Store/restStore.dart';
import 'package:yummy_bites/Widget/cutome_tabbar.dart';

import 'Store/myStore.dart';

void main() {
  return runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<MyStore>(
            create: (BuildContext context) {
          return MyStore();
        }),
        ChangeNotifierProvider<RestStore>(
            create: (BuildContext context) => RestStore()),
        ChangeNotifierProvider<CustomeTab>(create: (BuildContext context)=>CustomeTab())
      ],
      child: MaterialApp(
        theme: ThemeData.light(),
        debugShowCheckedModeBanner: false,
        home:SplashScreen(),
      ),
    ),
  );
}
