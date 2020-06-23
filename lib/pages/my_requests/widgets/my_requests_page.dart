import 'package:flutter/material.dart';
import 'package:handyclientapp/pages/help_selector/help_list/model/help.dart';
import 'package:handyclientapp/pages/my_requests/widgets/help_request.dart';

class MyRequestsPage extends StatelessWidget {
  final List<Help> helpRequests;

  MyRequestsPage({Key key, @required this.helpRequests}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Manage your requests')),
        ),
        body: Container(
          padding: EdgeInsets.only(top: 20),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: this.helpRequests.map((item) {
              return HelpRequest(helpRequest: item);
            }).toList(),
          ),
        ));
  }
}
