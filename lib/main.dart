import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handyclientapp/pages/pages.dart';
import 'package:handyclientapp/services/services.dart';

import 'handy_theme/handy_theme.dart';
import 'navigation/navigation.dart';

void main() {
  setupServiceLocator();
  runApp(HandyClient());
}

class HandyClient extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  final initialRoute = Routes.home;

  final routes = {
    Routes.home: (context) => HomePage(),
    Routes.intro: (context) => IntroPage(),
    Routes.helpSelector: (context) => HelpSelectorPage(),
    Routes.helpList: (context) => HelpListPage(),
    //Routes.helpDetail: (context) => HelpDetailWidget(),
    Routes.chat: (context) => ChatPage(),
    Routes.needHelp: (context) => NeedHelpWidget(),
    Routes.myHelpRequests: (context) => MyRequestsWidget(),
  };

  HandyClient();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NavigationBloc>(
          create: (context) => NavigationBloc(),
        ),
        BlocProvider<HandyThemeBloc>(
          create: (context) => HandyThemeBloc(),
        ),
        // BlocProvider<HelpListBloc>(
        //   create: (context) => HelpListBloc(
        //     deviceInfoService: locator<DeviceInfoService>(),
        //     helpService: locator<HelpService>(),
        //   ),
        // ),
        // BlocProvider<MyRequestsBloc>(
        //   create: (context) => MyRequestsBloc(
        //     deviceInfoService: locator<DeviceInfoService>(),
        //     helpService: locator<HelpService>(),
        //   ),
        // ),
      ],
      child: MaterialApp(
        home: HandyThemeWidget(
          navigatorKey: navigatorKey,
          initialRoute: initialRoute,
          routes: routes,
        ),
      ),
    );
  }
}
