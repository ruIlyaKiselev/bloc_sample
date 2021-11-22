import 'package:bloc_sample/logic/cubit/counter_cubit.dart';
import 'package:bloc_sample/logic/cubit/internet_cubit.dart';
import 'package:bloc_sample/presentation/router/app_router.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
      MyApp(
        appRouter: AppRouter(),
        connectivity: Connectivity(),
      )
  );
}

class MyApp extends StatelessWidget {

  final AppRouter appRouter;
  final Connectivity connectivity;

  MyApp({
    Key? key,
    required this.appRouter,
    required this.connectivity
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (context) => InternetCubit(connectivity: connectivity),
        ),
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(),
        ),
      ],
      child: MaterialApp(
        title: "Learning BloC!!!",
        theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity
        ),
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
