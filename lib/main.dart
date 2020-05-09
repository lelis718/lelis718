import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handyclientapp/modules/handy_theme/handy_theme.dart';
import 'package:handyclientapp/service_locator.dart';

import 'main_bloc.dart';
import 'models/models.dart';
import 'pages/pages.dart';
import 'services/services.dart';

void main() {
  setupServiceLocator();
  runApp(HandyClient());
}

class HandyClient extends StatelessWidget {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();
  final routes = {
    PageRoutes.home: (context) => HomePage(),
    PageRoutes.intro: (context) => IntroPage(),
  };

  HandyClient();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MainBloc>(
          create: (context) => MainBloc(),
        ),
        BlocProvider<HandyThemeBloc>(
          create: (context) => HandyThemeBloc(),
        ),
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(
            deviceInfoService: locator<DeviceInfoService>(),
          ),
        ),
        BlocProvider<IntroBloc>(
          create: (context) => IntroBloc(
            introService: locator<IntroService>(),
          ),
        ),
      ],
      child: BlocListener<MainBloc, MainState>(
        listener: (context, state) {
          if (state is NavigationChanged) {
            _navigatorKey.currentState.pushNamed(state.route);
          } else if (state is NavigationPop) {
            if (_navigatorKey.currentState.canPop()) {
              _navigatorKey.currentState.pop();
            }
          }
        },
        child: MaterialApp(
          home: HandyThemeWidget(
            navigatorKey: _navigatorKey,
            initialRoute: PageRoutes.home,
            routes: routes,
          ),
        ),
      ),
    );
  }
}

/*
Old code

    MaterialApp(
      home: BlocProvider(
        create: (BuildContext context) => handyBloc,
        child: BlocBuilder<HandyBloc, HandyState>(builder: (context, state) {
          if (state is HandyInitializingState) {
            return SplashPage(
              secondsToFinish: state.secondsToFinish,
              onFinish: () {
                context.bloc<HandyBloc>().add(HandyInitializedEvent());
              },
            );
          }

          if (state is HandyLoggedOutState) {
            return IntroPage(
              cardsInfo: state.cards,
              onFinishCards: () {
                context.bloc<HandyBloc>().add(HandyInitializedEvent());
              },
            );
          }

          if (state is HandyLoggedInState) {
            return HelpSelectorPage(
              onSwipeLeft: () {
                context.bloc<HandyBloc>().add(WantToHelpEvent());
              },
              onSwipeRight: () {
                context.bloc<HandyBloc>().add(NeedHelpEvent());
              },
              onRequestHelpTap: () {
                context.bloc<HandyBloc>().add(NeedHelpEvent());
              },
              onMyRequestsTap: () {
                context.bloc<HandyBloc>().add(MyRequestsEvent());
              },
              onHelpSomeoneTap: () {
                context.bloc<HandyBloc>().add(WantToHelpEvent());
              },
            );
          }

          if (state is LoadState) {
            return Loading();
          }

          if (state is WantToHelpState) {
            return HelpListPage(
              helpRequests: state.helpRequests,
              onHelp: (help) {
                context.bloc<HandyBloc>().add(StartChatEvent(help: help));
              },
            );
          }

          if (state is NeedHelpState) {
            return NeedHelpPage(
              deviceInfo: state.deviceInfo,
              onReturning: () {
                context.bloc<HandyBloc>().add(HandyInitializedEvent());
              },
              onSubmit: (helpRequest) {
                context
                    .bloc<HandyBloc>()
                    .add(SendRequestEvent(helpRequest: helpRequest));
              },
            );
          }

          if (state is RequestSentState) {
            if (state.isSuccess) {
              return RequestSucessConfirmation(
                onClose: () {
                  context.bloc<HandyBloc>().add(HandyInitializedEvent());
                },
              );
            }
          }

          if (state is StartChatState) {
            return ChatPage(
              help: state.help,
              messages: state.messages,
              deviceInfo: state.deviceInfo,
              onReturning: () {
                context.bloc<HandyBloc>().add(HandyInitializedEvent());
              },
              onSendMessage: (message) {
                context.bloc<HandyBloc>().add(SendChatMessageEvent());
              },
            );
          }

          if (state is MyRequestsState) {
            return MyRequestsPage(helpRequests: state.helpRequests);
          }
        
          return Container();
        }),
      ),
    );
  }
}
*/
