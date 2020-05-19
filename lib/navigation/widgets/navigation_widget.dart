import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../navigation.dart';

class NavigationWidget extends StatelessWidget {
  final Map<String, WidgetBuilder> routes;
  final String initialRoute;
  final GlobalKey<NavigatorState> navigatorKey;

  NavigationWidget({
    Key key,
    this.routes,
    this.initialRoute,
    this.navigatorKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<NavigationBloc, NavigationState>(
      listener: (context, state) {
        print("Current navigaton state $state");
        if (state is NavigationChangedState) {
          print("Changing route to ${state.route}");
          navigatorKey.currentState.pushNamed(state.route);
        }
        if (state is NavigationPoppedState) {
          if (navigatorKey.currentState.canPop()) {
            navigatorKey.currentState.pop();
          }
        }
      },
      child: Navigator(
        key: navigatorKey,
        initialRoute: this.initialRoute,
        observers: [DebugNavObserver()],
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(
            builder: (context) => routes[settings.name](context),
            settings: settings,
            maintainState: false,
          );
        },
      ),
    );
  }
}

class DebugNavObserver extends NavigatorObserver {
  @override
  void didPop(Route<dynamic> route, Route<dynamic> previousRoute) {
    print('Route removed ${route.settings.name}');
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic> previousRoute) {
    print('Route added ${route.settings.name}');
  }
}
