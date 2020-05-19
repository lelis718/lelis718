import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handyclientapp/handy_theme/handy_theme.dart';
import 'package:handyclientapp/navigation/navigation.dart';
import 'package:handyclientapp/pages/pages.dart';
import 'package:handyclientapp/pages/shared/shared.dart';
import 'package:handyclientapp/services/services.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context
        .bloc<HandyThemeBloc>()
        .add(HandyThemeUpdateTitleEvent(title: "Welcome to Handy!"));

    return MultiBlocProvider(
      providers: [
        BlocProvider<IntroBloc>(
          create: (context) => IntroBloc(
            introService: locator<IntroService>(),
          ),
        ),
      ],
      child: BlocBuilder<IntroBloc, IntroState>(
        builder: (context, state) {
          if (state is IntroInitializeState) {
            context.bloc<IntroBloc>().add(IntroLoadCardsEvent());
          }

          if (state is IntroCardsLoadedState) {
            return Container(
              color: Colors.white,
              child: Center(
                child: IntroCardList(
                  cards: state.cards,
                  onSwipeCard: (int cardIndex) {
                    context
                        .bloc<IntroBloc>()
                        .add(IntroRemoveCardEvent(cardIndex: cardIndex));
                  },
                ),
              ),
            );
          }
          if (state is IntroCardsEndedState) {
            context
                .bloc<NavigationBloc>()
                .add(NavigationGoToPageEvent(page: Routes.helpSelector));
          }
          return Loading(textToDisplay: "Loading...");
        },
      ),
    );
  }
}
