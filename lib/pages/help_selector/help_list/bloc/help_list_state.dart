import 'package:equatable/equatable.dart';

import '../help_list.dart';

abstract class HelpListState extends Equatable{
  const HelpListState();
}
class HelpListInitializeState extends HelpListState{
  @override
  List<Object> get props => null;
}
class HelpListLoadState extends HelpListState{
  @override
  List<Object> get props => null;
}

class HelpListWantToHelpState extends HelpListState{
  final List<Help> helpRequests;

  HelpListWantToHelpState({this.helpRequests});
  @override
  List<Object> get props => [helpRequests];
}

