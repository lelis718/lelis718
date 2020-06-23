import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handyclientapp/navigation/navigation.dart';
import 'package:handyclientapp/services/services.dart';

import '../need_help.dart';

class NeedHelpWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NeedHelpBloc>(
          create: (context) => NeedHelpBloc(
            deviceInfoService: locator<DeviceInfoService>(),
            helpService: locator<HelpService>(),
          ),
        )
      ],
      child: BlocBuilder<NeedHelpBloc, NeedHelpState>(
        builder: (context, state) {
          if (state is InitializeState) {
            context.bloc<NeedHelpBloc>().add(InitializeEvent());
          }
          if (state is PageLoadedState) {
            return NeedHelpPage(
              deviceInfo: state.deviceInfo,
              onReturning: () {
                context
                    .bloc<NavigationBloc>()
                    .add(NavigationGoToPageEvent(page: Routes.helpSelector));
              },
              onSubmit: (helpRequest) {
                context
                    .bloc<NeedHelpBloc>()
                    .add(SendRequestEvent(helpRequest: helpRequest));
              },
            );
          }
          if (state is RequestSentState) {
            if (state.isSuccess) {
              return RequestSuccessConfirmation(
                onClose: () {
                  context
                      .bloc<NavigationBloc>()
                      .add(NavigationGoToPageEvent(page: Routes.helpSelector));
                },
              );
            }
          }

          return Container();
        },
      ),
    );
  }
}
