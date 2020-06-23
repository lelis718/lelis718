import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handyclientapp/handy_theme/handy_theme.dart';
import 'package:handyclientapp/models/device_info.dart';
import 'package:handyclientapp/pages/help_selector/help_list/model/help.dart';
import 'package:handyclientapp/pages/pages.dart';

import '../chat.dart';

class ChatWidget extends StatelessWidget {
  final Help help;
  final VoidCallback onReturning;
  final Function(String) onSendMessage;
  final List<ChatMessage> messages;
  final DeviceInfo deviceInfo;

  ChatWidget({
    this.onReturning,
    this.help,
    this.onSendMessage,
    this.messages,
    this.deviceInfo,
  });

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HandyThemeBloc>(context)
        .add(HandyThemeUpdateTitleEvent(title: "Chat"));

    String message;

    return Column(
      children: <Widget>[
        _buildListMessages(),
        _buildInput(message),
      ],
    );
  }

  Widget _buildListMessages() {
    return Expanded(
      child: ListView.builder(
        reverse: true,
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final isMyMessage = messages[index].userId == this.deviceInfo.uuid;

          return ListTile(
            title: Text(
              messages[index].message,
              textAlign: isMyMessage ? TextAlign.right : TextAlign.left,
            ),
            subtitle: Text(
              '${isMyMessage ? 'me' : messages[index].userId} - ${_formatDate(messages[index].date)}',
              textAlign: isMyMessage ? TextAlign.right : TextAlign.left,
            ),
          );
        },
      ),
    );
  }

  Widget _buildInput(String message) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: TextField(
            onChanged: (value) {
              message = value;
            },
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              hintText: 'Type your message here...',
              border: InputBorder.none,
            ),
          ),
        ),
        FlatButton(
          onPressed: () {
            this.onSendMessage(message);
          },
          child: Text(
            'Send',
            style: TextStyle(
              color: Colors.lightBlueAccent,
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
        ),
      ],
    );
  }

  String _formatDate(DateTime date) {
    return '${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}:';
  }
}
