import 'package:bloc_sample/logic/cubit/counter_cubit.dart';
import 'package:bloc_sample/presentation/screens/home_screen.dart';
import 'package:bloc_sample/presentation/screens/second_screen.dart';
import 'package:bloc_sample/presentation/screens/third_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRouter {

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(
              title: "Learning BloC!!!",
              color: Colors.greenAccent
          ),
        );
      case '/second':
        return MaterialPageRoute(
          builder: (_) => const SecondScreen(
              title: 'Second Screen!',
              color: Colors.redAccent
          ),
        );
      case '/third':
        return MaterialPageRoute(
          builder: (_) => const ThirdScreen(
              title: 'Third Screen!!!',
              color: Colors.purpleAccent
          ),
        );
      default: return MaterialPageRoute(
        builder: (_) => const HomeScreen(
            title: "Learning BloC!!!",
            color: Colors.greenAccent
        ),
      );
    }
  }
}