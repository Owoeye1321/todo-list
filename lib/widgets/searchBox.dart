import "package:flutter/material.dart";

import "../constants/colors.dart";
import "../model/todo_model.dart";

Widget SearchBar(_runFilter) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
    ),
    child: TextField(
      onChanged: (value) => _runFilter(value),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20),
        prefixIcon: Icon(
          Icons.search,
          color: tdBlack,
          size: 20,
        ),
        prefixIconConstraints: BoxConstraints(maxHeight: 20, minWidth: 25),
        border: InputBorder.none,
        hintText: "Search",
        hintStyle: TextStyle(color: tdGrey),
      ),
    ),
  );
}
