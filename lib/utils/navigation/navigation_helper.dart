import 'package:flutter/material.dart';
import 'package:recipes_app/ui/home/home_screen.dart';
import 'package:recipes_app/ui/recipe_details/recipe_details_screen.dart';
import 'package:recipes_app/ui/splash/splash_screen.dart';


final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

Route getApplicationRoute(RouteSettings settings) {
  switch (settings.name) {

    case SplashScreen.tag:
      return _buildScreen(settings, const SplashScreen());

    case HomeScreen.tag:
      return _buildScreen(settings, const HomeScreen());

    case RecipeDetailsScreen.tag:
      return _buildScreen(settings, const RecipeDetailsScreen());

    default:
      throw Exception("un registered route");
  }
}

PageRouteBuilder _buildScreen(RouteSettings settings, Widget screen){
  return PageRouteBuilder(
      settings: settings,
      pageBuilder: (_, __, ___) => screen,
      transitionsBuilder: (_, animation, __, child) =>
          FadeTransition(opacity: animation, child: child)
  );
}