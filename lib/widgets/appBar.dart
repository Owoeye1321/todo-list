import 'package:flutter/material.dart';

import '../constants/colors.dart';

PreferredSizeWidget MyAppBar({required Size preferredSize}) {
  return AppBar(
    elevation: 0,
    backgroundColor: tdBGColor,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          Icons.menu,
          color: tdBlack,
          size: 30,
        ),
        Container(
          height: 40,
          width: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset('assets/images/avatar.png'),
          ),
        ),
      ],
    ),
  );
}
