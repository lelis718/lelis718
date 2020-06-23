import 'dart:convert';

import 'package:handyclientapp/pages/help_selector/help_list/model/model.dart';
import 'package:handyclientapp/pages/pages.dart';
import 'package:http/http.dart';
import 'package:uuid/uuid.dart';

abstract class HelpService {
  Future<bool> askHelp(Help help);
  Future<List<Help>> getOtherHelpRequests(String userId);
  Future<List<Help>> getMyHelpRequests(String userId);
  List<ChatMessage> getChatMessages();
}

class HelpServiceDefault extends HelpService {
  //final address = "https://us-central1-handy-app-ad6a5.cloudfunctions.net";
  final address = 'http://10.0.2.2:5000/handy-app-ad6a5/us-central1';

  @override
  Future<bool> askHelp(Help help) async {
    final helpJson = help.toJson();
    helpJson['id'] = Uuid().v4();
    var response = await post("$address/app/help", body: helpJson);
    return response.statusCode == 200;
  }

  @override
  Future<List<Help>> getOtherHelpRequests(String userId) async {
    final response = await get("$address/app/help/others/$userId");
    return _formatHelpRequest(response);
  }

  @override
  Future<List<Help>> getMyHelpRequests(String userId) async {
    final response = await get("$address/app/help/my/$userId");
    return _formatHelpRequest(response);
  }

  @override
  List<ChatMessage> getChatMessages() {
    var list = List<ChatMessage>();

    list.add(
      ChatMessage(
        userId: '17914a249e51be07',
        message: 'Thank you',
        date: DateTime.now().subtract(Duration(minutes: 19)),
      ),
    );

    list.add(
      ChatMessage(
        userId: '4645648abf432sffda2',
        message: 'Yeah, sure',
        date: DateTime.now().subtract(Duration(minutes: 28)),
      ),
    );

    list.add(
      ChatMessage(
        userId: '17914a249e51be07',
        message: 'Hello, are you going to help me',
        date: DateTime.now().subtract(Duration(minutes: 39)),
      ),
    );

    list.add(
      ChatMessage(
        userId: '4645648abf432sffda2',
        message: 'Hello',
        date: DateTime.now().subtract(Duration(minutes: 40)),
      ),
    );

    return list;
  }

  List<Help> _formatHelpRequest(Response response) {
    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      List<Help> helps = List<Help>();
      for (final h in result) {
        helps.add(Help.fromJson(h));
      }
      return helps;
    } else {
      throw Exception('Failed to get help');
    }
  }
}
