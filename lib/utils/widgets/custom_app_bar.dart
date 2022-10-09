import 'package:flutter/material.dart';
import 'package:recipes_app/ui/search/search_screen.dart';
import 'package:recipes_app/utils/app_colors.dart';

AppBar buildCustomAppbar(BuildContext context) {
  return AppBar(
    leading: IconButton(
      onPressed: () {
        Navigator.pushNamed(context, SearchScreen.tag);
      },
      icon: Icon(Icons.search,
        color: AppColors.green,),
    ),
    backgroundColor: Colors.white,
    elevation: 0,
    centerTitle: true,
    title: Column(
      children: [
        RichText(
          text: TextSpan(
              text: "GOOD",
              style: TextStyle(color: AppColors.green, fontSize: 25),
              children: const [
                TextSpan(text: "MEAL", style: TextStyle(color: Colors.black)),
              ]
          ),
        ),
        Text(
          "Food Recipes",
          style: TextStyle(color: Colors.grey.shade400, fontSize: 13),
        )
      ],
    ),
  );
}
