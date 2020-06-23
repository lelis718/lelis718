import 'package:equatable/equatable.dart';

abstract class HandyThemeEvent extends Equatable{
  const HandyThemeEvent();
}

class HandyThemeUpdateTitleEvent extends HandyThemeEvent{
  final String title;
  const HandyThemeUpdateTitleEvent({this.title});
  @override
  List<Object> get props => [title];
}
