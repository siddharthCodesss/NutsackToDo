import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutsacktodo/app/apis/response/ui_status.dart';
import 'package:rxdart/rxdart.dart';

import 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  Connectivity _connectivity = Connectivity();

  final _uiStatus = BehaviorSubject<UIStatus>.seeded(UIStatus());
  Stream<UIStatus> get uiStatus => _uiStatus.stream;
  Function(UIStatus) get changeUIStatus => _uiStatus.sink.add;
  UIStatus get uiStatusValue => _uiStatus.value;

  InternetCubit() : super(InternetInitialState()) {
    _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        _uiStatus.sink.add(UIStatus(connectionStatus: true));
      } else {
        _uiStatus.sink.add(UIStatus(connectionStatus: false));
      }
    });
  }
}
