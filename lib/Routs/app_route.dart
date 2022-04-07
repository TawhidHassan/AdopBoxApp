
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    final Map? args = settings.arguments as Map?;
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => Container());


      default:
        return MaterialPageRoute(
            builder: (BuildContext context) => Container());
    }
  }
}