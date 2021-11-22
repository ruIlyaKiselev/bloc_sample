import 'package:bloc_sample/logic/cubit/counter_cubit.dart';
import 'package:bloc_sample/presentation/screens/home_screen.dart';
import 'package:bloc_sample/presentation/screens/second_screen.dart';
import 'package:bloc_sample/presentation/screens/third_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {

  final CounterCubit _counterCubit = CounterCubit();

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider.value(
                value: _counterCubit,
                child: const HomeScreen(
                    title: "Learning BloC!!!",
                    color: Colors.greenAccent
                ),
              ),
        );
      case '/second':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
              value: _counterCubit,
              child: const SecondScreen(
                  title: 'Second Screen!',
                  color: Colors.redAccent
              ),
            )
        );
      case '/third':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
              value: _counterCubit,
              child: const ThirdScreen(
                  title: 'Third Screen!!!',
                  color: Colors.purpleAccent
              ),
            )
        );
      default: return MaterialPageRoute(
        builder: (_) =>
            BlocProvider.value(
              value: _counterCubit,
              child: const HomeScreen(
                  title: "Learning BloC!!!",
                  color: Colors.greenAccent
              ),
            ),
      );
    }
  }

  void dispose() {
    _counterCubit.close();
  }
}