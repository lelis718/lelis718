import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:handyclientapp/pages/shared/shared.dart';

class ActionFooter extends StatelessWidget {
  final VoidCallback onMyRequests;
  final VoidCallback onRequestHelp;
  final VoidCallback onHelpSomeone;

  const ActionFooter(
      {@required this.onMyRequests,
      @required this.onRequestHelp,
      @required this.onHelpSomeone});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ActionFooterButton(
            key: Key('ActionFooter_RequestHelp'),
            iconButton: FontAwesomeIcons.handPaper,
            textButton: 'Request Help',
            onTap: () => this.onRequestHelp(),
          ),
          ActionFooterButton(
            key: Key('ActionFooter_MyRequest'),
            iconButton: FontAwesomeIcons.list,
            textButton: 'My requests',
            onTap: () => this.onMyRequests(),
          ),
          ActionFooterButton(
            key: Key('ActionFooter_HelpSomeone'),
            iconButton: FontAwesomeIcons.handshake,
            textButton: 'Help Someone',
            onTap: () => this.onHelpSomeone(),
          ),
        ],
      ),
    );
  }
}
