import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handyclientapp/navigation/navigation.dart';
import 'package:handyclientapp/pages/pages.dart';
import 'package:handyclientapp/pages/shared/shared.dart';
import 'package:handyclientapp/services/services.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(
            deviceInfoService: locator<DeviceInfoService>(),
          ),
        ),
      ],
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeInitializeState) {
            context.bloc<HomeBloc>().add(
                  HomeInitializeEvent(),
                );
          } else if (state is HomeIntroState) {
            BlocProvider.of<NavigationBloc>(context).add(
              NavigationGoToPageEvent(
                page: Routes.intro,
              ),
            );
          } else if (state is HomeHelpSelectState) {
            BlocProvider.of<NavigationBloc>(context).add(
              NavigationGoToPageEvent(
                page: Routes.helpSelector,
              ),
            );
          }
          return Loading(textToDisplay: "loading (home)...");
        },
      ),
    );
  }
}
