import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:handyclientapp/services/services.dart';

import '../intro.dart';

class IntroBloc extends Bloc<IntroEvent, IntroState> {
  final IntroService introService;

  IntroBloc({@required this.introService});

  @override
  IntroState get initialState {
    return IntroInitializeState();
  }

  @override
  Stream<IntroState> mapEventToState(
    IntroEvent event,
  ) async* {
    print("event fired $event");
    if (event is IntroLoadCardsEvent) {
      yield IntroLoadingCardsState();
      final cards = introService.resetAndGetCards();
      yield IntroCardsLoadedState(cards: cards);
    }

    if (event is IntroRemoveCardEvent) {
      yield IntroLoadingCardsState();
      final cards = introService.removeAndGetCards(event.cardIndex);
      yield (cards.length > 0)
          ? IntroCardsLoadedState(cards: cards)
          : IntroCardsEndedState();
    }
  }
}
