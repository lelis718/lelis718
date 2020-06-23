import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handyclientapp/services/device_info_service.dart';
import 'package:handyclientapp/services/services.dart';

import '../need_help.dart';

class NeedHelpBloc extends Bloc<NeedHelpEvent, NeedHelpState>{

  final DeviceInfoService deviceInfoService;
  final HelpService helpService;

  NeedHelpBloc({this.deviceInfoService, this.helpService});


  @override
  NeedHelpState get initialState => InitializeState();

  @override
  Stream<NeedHelpState> mapEventToState(NeedHelpEvent event) async* {
    if(event is InitializeEvent){
      final deviceInfo = await this.deviceInfoService.getDeviceInfo();
      yield PageLoadedState(deviceInfo:deviceInfo);
    }
    if (event is SendRequestEvent) {
      final isSuccess = await helpService.askHelp(event.helpRequest);
      yield RequestSentState(isSuccess: isSuccess);
    }    

  }
  
}