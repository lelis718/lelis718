import 'package:equatable/equatable.dart';

abstract class HelpSelectorEvent extends Equatable{
  const HelpSelectorEvent();
}

class HelpSelectorInitializeEvent extends HelpSelectorEvent{
  @override
  List<Object> get props => null;
}