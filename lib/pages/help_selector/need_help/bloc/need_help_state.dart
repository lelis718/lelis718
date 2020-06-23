import 'package:equatable/equatable.dart';
import 'package:handyclientapp/models/device_info.dart';

abstract class NeedHelpState extends Equatable{
  const NeedHelpState();
} 

class InitializeState extends NeedHelpState{
  @override
  List<Object> get props => null;
}
class PageLoadedState extends NeedHelpState{
  final DeviceInfo deviceInfo;

  PageLoadedState({this.deviceInfo});
  @override
  List<Object> get props => [deviceInfo];
}

class RequestSentState extends NeedHelpState {
  final bool isSuccess;

  RequestSentState({this.isSuccess});

  @override
  List<Object> get props => [isSuccess];
}