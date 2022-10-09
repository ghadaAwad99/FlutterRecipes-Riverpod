import 'package:flutter/material.dart';
import 'package:recipes_app/ui/home/home_screen.dart';
import 'package:recipes_app/ui/recipe_details/recipe_details_screen.dart';

final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

Route getApplicationRoute(RouteSettings settings) {

  //late final Recipe args;
  //if(settings.arguments != null) args = settings.arguments as Recipe;

  switch (settings.name) {
    case HomeScreen.tag:
      return MaterialPageRoute(builder: (context)=> const HomeScreen());

    case RecipeDetailsScreen.tag:
      return MaterialPageRoute(builder: (context)=> RecipeDetailsScreen(), settings: settings);

    default:
      throw Exception("un registered route");
  }
}