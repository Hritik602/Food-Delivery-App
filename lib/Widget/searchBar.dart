import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        decoration: InputDecoration(
            hintText: "Search  Your Favourites Food",
            suffixIcon: Icon(
              Icons.search,
              size: 34,
              color: Colors.black,
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.black38),
                borderRadius: BorderRadius.circular(15))),
      ),
    );
  }
}