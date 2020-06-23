import 'package:equatable/equatable.dart';
import 'package:handyclientapp/pages/help_selector/help_list/model/help.dart';

abstract class NeedHelpEvent extends Equatable {
  const NeedHelpEvent();
}

class InitializeEvent extends NeedHelpEvent {
  @override
  List<Object> get props => null;
}

class SendRequestEvent extends NeedHelpEvent {
  final Help helpRequest;

  const SendRequestEvent({this.helpRequest});

  @override
  List<Object> get props => [helpRequest];
}
