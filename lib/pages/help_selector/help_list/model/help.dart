import 'package:equatable/equatable.dart';

class Help extends Equatable {
  final String id;
  final String user;
  final String message;

  Help({
    this.id,
    this.user,
    this.message,
  });

  factory Help.fromJson(Map<String, dynamic> json) {
    return Help(
      id: json["id"],
      user: json["user"],
      message: json["message"],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': this.id,
        'user': this.user,
        'message': this.message,
      };

  @override
  List<Object> get props => [id, user, message];
}
