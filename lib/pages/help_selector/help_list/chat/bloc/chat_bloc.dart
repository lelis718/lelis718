import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handyclientapp/services/services.dart';

import '../chat.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final HelpService helpService;
  final DeviceInfoService deviceInfoService;

  ChatBloc({this.helpService, this.deviceInfoService});

  @override
  ChatState get initialState => ChatInitializeState();

  @override
  Stream<ChatState> mapEventToState(ChatEvent event) async* {
    if (event is ChatStartEvent) {
      final messages = helpService.getChatMessages();
      final deviceInfo = await this.deviceInfoService.getDeviceInfo();
      yield ChatStartState(
          help: event.help, messages: messages, deviceInfo: deviceInfo);
    }
  }
}
