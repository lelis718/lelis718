
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handyclientapp/services/device_info_service.dart';
import 'package:handyclientapp/services/help_service.dart';

import 'bloc.dart';

class MyRequestsBloc extends Bloc<MyRequestsEvent, MyRequestsState>{

  final DeviceInfoService deviceInfoService;
  final HelpService helpService;

  MyRequestsBloc({@required this.deviceInfoService, @required this.helpService});

  @override
  MyRequestsState get initialState => MyRequestsInitalizeState();

  @override
  Stream<MyRequestsState> mapEventToState(MyRequestsEvent event) async* {
    if(event is MyRequestsLoadEvent){
      final userId = (await deviceInfoService.getDeviceInfo()).uuid;
      final myHelpRequests = await helpService.getMyHelpRequests(userId);
      yield MyRequestsLoadedState(helpRequests: myHelpRequests);      
    }

  }

}