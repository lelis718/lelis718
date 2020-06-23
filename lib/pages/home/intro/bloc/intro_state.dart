import 'package:equatable/equatable.dart';

import '../intro.dart';

abstract class IntroState extends Equatable {
  const IntroState();
}

class IntroInitializeState extends IntroState {
  @override
  List<Object> get props => null;
}

class IntroLoadingCardsState extends IntroState{
  @override
  List<Object> get props => null;
}
class IntroCardsLoadedState extends IntroState {
  final List<CardInfo> cards;

  const IntroCardsLoadedState({this.cards});

  @override
  List<Object> get props => [cards];
}
class IntroCardsEndedState extends IntroState{
  @override
  List<Object> get props => null;
}
