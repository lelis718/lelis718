import 'package:equatable/equatable.dart';

class ChatMessage extends Equatable {
  const ChatMessage({this.userId, this.message, this.date});

  final String userId;
  final String message;
  final DateTime date;

  @override
  List<Object> get props => [userId, message, date];
}
