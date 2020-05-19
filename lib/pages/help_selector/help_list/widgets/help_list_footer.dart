import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HelpListFooter extends StatelessWidget {
  final VoidCallback onNextHelp;
  final VoidCallback onHelp;

  const HelpListFooter({@required this.onNextHelp, @required this.onHelp});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      items: [
        BottomNavigationBarItem(
          icon: IconButton(
            icon: Icon(FontAwesomeIcons.stickyNote),
            onPressed: () => this.onNextHelp(),
          ),
          title: Text('Swipe Left for next card'),
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            icon: Icon(FontAwesomeIcons.comments),
            onPressed: () => this.onHelp(),
          ),
          title: Text('Swipe Right to give a hand'),
        ),
      ],
    );
  }
}
