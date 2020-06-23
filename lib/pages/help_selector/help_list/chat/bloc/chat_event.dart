import 'package:equatable/equatable.dart';
import 'package:handyclientapp/pages/help_selector/help_list/model/help.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();
}

class ChatSendMessageEvent extends ChatEvent {
  @override
  List<Object> get props => null;
}

class ChatStartEvent extends ChatEvent {
  final Help help;

  ChatStartEvent({this.help});
  @override
  List<Object> get props => [help];
}
