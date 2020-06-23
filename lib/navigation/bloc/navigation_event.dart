
import 'package:equatable/equatable.dart';

abstract class NavigationEvent extends Equatable{
  const NavigationEvent();
}
class NavigationGoToHomeEvent extends NavigationEvent{
  @override
  List<Object> get props => null;
}
class NavigationGoToPageEvent extends NavigationEvent{
  final String page;
  final dynamic args;
  NavigationGoToPageEvent({this.page, this.args});
  @override
  List<Object> get props => [page,args];
}
class NavigationPopEvent extends NavigationEvent{
  @override
  List<Object> get props => null;
}
