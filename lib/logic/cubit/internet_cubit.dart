import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_sample/Core/enums.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {

  final Connectivity connectivity;
  StreamSubscription? connectivityStreamSubscription;

  InternetCubit({
    required this.connectivity
  }) : super(InternetLoading()) {
    connectivityStreamSubscription = connectivity.onConnectivityChanged.listen((connectivityResult) {
      switch(connectivityResult) {
        case ConnectivityResult.wifi:
          emitInternetConnected(ConnectionType.wifi);
          break;
        case ConnectivityResult.ethernet:
          emitInternetConnected(ConnectionType.mobile);
          break;
        case ConnectivityResult.mobile:
          emitInternetConnected(ConnectionType.mobile);
          break;
        case ConnectivityResult.none:
          emitDisconnected();
          break;
      }
    });
  }

  void emitInternetConnected (ConnectionType connectionType) =>
      emit(InternetConnected(connectionType: connectionType));

  void emitDisconnected () => emit(InternetDisconnected());

  @override
  Future<void> close() {
    connectivityStreamSubscription?.cancel();
    return super.close();
  }
}