import 'package:equatable/equatable.dart';
import 'package:handyclientapp/pages/help_selector/help_list/model/help.dart';

abstract class MyRequestsState extends Equatable {
  const MyRequestsState();
}

class MyRequestsInitalizeState extends MyRequestsState {
  @override
  List<Object> get props => null;
}

class MyRequestsLoadedState extends MyRequestsState {
  final List<Help> helpRequests;

  MyRequestsLoadedState({this.helpRequests});
  @override
  List<Object> get props => [helpRequests];
}
