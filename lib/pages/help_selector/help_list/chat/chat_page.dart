import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handyclientapp/navigation/navigation.dart';
import 'package:handyclientapp/pages/help_selector/help_list/chat/chat.dart';
import 'package:handyclientapp/pages/shared/shared.dart';
import 'package:handyclientapp/services/services.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ChatBloc>(
          create: (context) => ChatBloc(
            deviceInfoService: locator<DeviceInfoService>(),
            helpService: locator<HelpService>(),
          )..add(ChatStartEvent()),
        )
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text('Chat page'),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                context.bloc<NavigationBloc>().add(
                      NavigationGoToPageEvent(
                        page: Routes.helpList,
                      ),
                    );
              }),
        ),
        body: BlocBuilder<ChatBloc, ChatState>(
          builder: (context, state) {
            if (state is ChatStartState) {
              return ChatWidget(
                help: state.help,
                messages: state.messages,
                deviceInfo: state.deviceInfo,
                onReturning: () {
                  context.bloc<NavigationBloc>().add(
                        NavigationGoToPageEvent(
                          page: Routes.helpDetail,
                          args: state.help,
                        ),
                      );
                },
                onSendMessage: (message) {
                  context.bloc<ChatBloc>().add(ChatSendMessageEvent());
                },
              );
            }
            return Loading(textToDisplay: "Loading ...");
          },
        ),
      ),
    );
  }
}
