

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yummy_bites/Pages/home_page.dart';
import 'package:yummy_bites/Pages/itemDetailPage.dart';
import 'package:yummy_bites/Store/restStore.dart';

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
            create: (BuildContext context) => RestStore())
      ],
      child: MaterialApp(
        theme: ThemeData.light(),
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    ),
  );
}
