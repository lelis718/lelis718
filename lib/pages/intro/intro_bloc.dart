import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:handyclientapp/pages/intro/intro.dart';
import 'package:handyclientapp/services/services.dart';

class IntroBloc extends Bloc<IntroEvent, IntroState> {
  final IntroService introService;

  IntroBloc({@required this.introService});

  @override
  IntroState get initialState {
    return Initialize();
  }

  @override
  Stream<IntroState> mapEventToState(
    IntroEvent event,
  ) async* {
    if (event is LoadCards) {
      yield LoadingCards();
      final cards = introService.resetAndGetCards();
      yield CardsLoaded(cards: cards);
    } else if (event is RemoveCard) {
      yield LoadingCards();
      final cards = introService.removeAndGetCards(event.cardIndex);
      yield cards.length > 0 ? CardsLoaded(cards: cards) : CardsEnded();
    }
  }
}
