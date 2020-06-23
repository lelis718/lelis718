import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handyclientapp/navigation/navigation.dart';
import 'package:handyclientapp/pages/pages.dart';

class HelpSelectorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HelpSelectorBloc>(
          create: (context) => HelpSelectorBloc(),
        ),
      ],
      child: BlocBuilder<HelpSelectorBloc, HelpSelectorState>(
        builder: (context, state) {
          print("state changed $state");
          if (state is HelpSelectorHandyLoggedInState) {
            return HelpSelectorWidget(
              onSwipeLeft: () {
                context
                    .bloc<NavigationBloc>()
                    .add(NavigationGoToPageEvent(page: Routes.needHelp));
              },
              onSwipeRight: () {
                context
                    .bloc<NavigationBloc>()
                    .add(NavigationGoToPageEvent(page: Routes.helpList));
              },
              onRequestHelpTap: () {
                context
                    .bloc<NavigationBloc>()
                    .add(NavigationGoToPageEvent(page: Routes.needHelp));
              },
              onMyRequestsTap: () {
                context
                    .bloc<NavigationBloc>()
                    .add(NavigationGoToPageEvent(page: Routes.myHelpRequests));
              },
              onHelpSomeoneTap: () {
                context
                    .bloc<NavigationBloc>()
                    .add(NavigationGoToPageEvent(page: Routes.helpList));
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
