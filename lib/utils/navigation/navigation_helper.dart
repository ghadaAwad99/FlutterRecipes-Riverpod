import 'package:flutter/material.dart';
import 'package:recipes_app/presentation/home/home_screen.dart';
import 'package:recipes_app/presentation/recipe_details/recipe_details_screen.dart';

final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

Route getApplicationRoute(RouteSettings settings) {

  switch (settings.name) {
    case HomeScreen.tag:
      return MaterialPageRoute(builder: (context)=> const HomeScreen());

    case RecipeDetailsScreen.tag:
      return MaterialPageRoute(builder: (context)=> const RecipeDetailsScreen());

    default:
      throw Exception("un registered route");
  }
}