import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handyclientapp/main_bloc.dart';
import 'package:handyclientapp/models/models.dart';
import 'package:handyclientapp/pages/intro/intro.dart';
import 'package:handyclientapp/pages/pages.dart';
import 'package:handyclientapp/pages/shared/shared.dart';

import 'widgets.dart';

class IntroPage extends StatelessWidget {
  IntroPage();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IntroBloc, IntroState>(builder: (context, state) {
      if (state is Initialize) {
        context.bloc<IntroBloc>().add(LoadCards());
      }
      if (state is CardsLoaded) {
        return Container(
          color: Colors.white,
          child: Center(
            child: IntroCardList(
              cards: state.cards,
              onSwipeCard: (int cardIndex) {
                context.bloc<IntroBloc>().add(RemoveCard(cardIndex: cardIndex));
              },
            ),
          ),
        );
      }
      if (state is CardsEnded) {
        context
            .bloc<MainBloc>()
            .add(NavigateToPage(page: PageRoutes.helpSelector));
      }
      return Loading(textToDisplay: "Loading...");
    });
  }
}
