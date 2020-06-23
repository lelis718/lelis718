import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:handyclientapp/services/device_info_service.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final DeviceInfoService deviceInfoService;
  HomeBloc({@required this.deviceInfoService});

  @override
  HomeState get initialState {
    return HomeInitializeState();
  }

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is HomeInitializeEvent) {
      final deviceInfo = await deviceInfoService.getDeviceInfo();
      if (!deviceInfo.hasLoggedIn) {
        yield HomeIntroState();
      } else {
        yield HomeHelpSelectState();
      }
    }
  }
}
