import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handyclientapp/navigation/navigation.dart';

import '../handy_theme.dart';

class HandyThemeWidget extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final Map<String, WidgetBuilder> routes;
  final String initialRoute;

  HandyThemeWidget({
    this.routes,
    this.initialRoute,
    this.navigatorKey,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationWidget(
      navigatorKey: navigatorKey,
      initialRoute: this.initialRoute,
      routes: routes,
    );
  }
}
