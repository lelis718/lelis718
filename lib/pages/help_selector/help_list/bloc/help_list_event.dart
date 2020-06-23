import 'package:equatable/equatable.dart';

abstract class HelpListEvent extends Equatable{
  const HelpListEvent();
} 
class HelpListWantToHelpEvent extends HelpListEvent{
  @override
  List<Object> get props => null;
}

