import 'package:equatable/equatable.dart';

abstract class NavigationState extends Equatable{
}
class NavigationChangedState extends NavigationState{
  final String route;
  NavigationChangedState(this.route);
  @override
  List<Object> get props => [route];
}
class NavigationPoppedState extends NavigationState{
  @override
  List<Object> get props => null;
}

