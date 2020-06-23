import 'package:equatable/equatable.dart';

abstract class MyRequestsEvent extends Equatable{
  const MyRequestsEvent();
}
class MyRequestsLoadEvent extends MyRequestsEvent{
  @override
  List<Object> get props => null;
}