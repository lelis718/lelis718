import 'package:equatable/equatable.dart';

abstract class HandyThemeState extends Equatable{
  const HandyThemeState();
}
class HandyThemeInitializeState extends HandyThemeState{
  @override
  List<Object> get props => null;
}
class HandyThemeTitleUpdatedState extends HandyThemeState{
  final String title;
  const HandyThemeTitleUpdatedState({this.title});
  @override
  List<Object> get props => [title];
}
