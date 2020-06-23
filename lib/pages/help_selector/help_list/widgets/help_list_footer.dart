import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:handyclientapp/pages/shared/shared.dart';

class HelpListFooter extends StatelessWidget {
  final VoidCallback onNextHelp;
  final VoidCallback onHelp;

  const HelpListFooter({@required this.onNextHelp, @required this.onHelp});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ActionFooterButton(
            iconButton: FontAwesomeIcons.stickyNote,
            textButton: "Swipe Left for next card",
            onTap: () => this.onNextHelp(),
          ),
          ActionFooterButton(
            iconButton: FontAwesomeIcons.comments,
            textButton: "Swipe Right to give a hand",
            onTap: () => this.onHelp(),
          ),
        ],
      ),
    );
  }
}
