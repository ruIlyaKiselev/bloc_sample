import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_sample/Core/enums.dart';
import 'package:bloc_sample/logic/cubit/internet_cubit.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {

  final InternetCubit internetCubit;
  StreamSubscription? internetStreamSubscription;

  CounterCubit({
    required this.internetCubit
  }) : super(
      CounterState(
          counterValue: 0,
          wasIncremented: false
      )
  ) {
    internetStreamSubscription = initInternetStreamSubscription();
  }

  StreamSubscription<ConnectivityResult>? initInternetStreamSubscription() {
    internetCubit.stream.listen((internetState) {
      if (internetState is InternetConnected) {
        if (internetState.connectionType == ConnectionType.wifi) {
          increment();
        }
        if (internetState.connectionType == ConnectionType.mobile) {
          decrement();
        }
      }
    });
  }

  void increment() => emit(
      CounterState(
          counterValue: state.counterValue + 1,
          wasIncremented: true
      )
  );
  void decrement() => emit(
      CounterState(
          counterValue: state.counterValue - 1,
          wasIncremented: false
      )
  );

  @override
  Future<void> close() {
    internetStreamSubscription?.cancel();
    return super.close();
  }
}