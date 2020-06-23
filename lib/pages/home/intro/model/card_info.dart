import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class CardInfo extends Equatable {
  final String title;
  final IconData icon;
  final Color color;

  CardInfo({@required this.title, @required this.icon, @required this.color});

  @override
  List<Object> get props => [title, icon, color];
}
