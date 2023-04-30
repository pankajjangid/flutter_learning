import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:connectivity/connectivity.dart';

part 'internet_event.dart';
part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  Connectivity _connectivity = Connectivity();
  StreamSubscription? connectivitySubscription;

  InternetBloc() : super(InternetInitial()) {
    on<InternetEvent>((event, emit) {

    });

    on<InternetConnectedEvent>((event,emit)=> emit(InternetConnectedState()));
    on<InternetDisconnectedEvent>((event,emit)=> emit(InternetDisconnectedState()));

    connectivitySubscription = _connectivity.onConnectivityChanged.listen((event) {
      if(event == ConnectivityResult.mobile || event == ConnectivityResult.wifi){
        add(InternetConnectedEvent());
      }else{
        add(InternetDisconnectedEvent());
      }
    });
  }

  @override
  Future<void> close() {
    connectivitySubscription?.cancel();
    return super.close();
  }
}
