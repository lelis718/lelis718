import 'package:equatable/equatable.dart';
import 'package:handyclientapp/models/models.dart';

class IntroState extends Equatable {
  @override
  List get props => null;
}

class Initialize extends IntroState {}

class LoadingCards extends IntroState {}

class CardsLoaded extends IntroState {
  final List<CardInfo> cards;
  CardsLoaded({this.cards});

  @override
  List get props => [cards];
}

class CardsEnded extends IntroState {}
