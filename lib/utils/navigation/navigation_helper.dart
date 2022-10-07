import 'package:flutter/material.dart';
import 'package:recipes_app/presentation/home/home_screen.dart';

final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

Route getApplicationRoute(RouteSettings settings) {

  switch (settings.name) {
    case HomeScreen.tag:
      return MaterialPageRoute(builder: (context)=> const HomeScreen());

    default:
      throw Exception("un registered route");
  }
}