import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:handyclientapp/navigation/bloc/bloc.dart';
import 'package:handyclientapp/navigation/model/routes.dart';

class HelpSelectorNavigationBar extends StatefulWidget {
  @override
  _HelpSelectorNavigationBarState createState() =>
      _HelpSelectorNavigationBarState();
}

class _HelpSelectorNavigationBarState extends State<HelpSelectorNavigationBar> {
  int _selectedIndex = 1;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      BlocProvider.of<NavigationBloc>(context).add(
        NavigationGoToPageEvent(
          page: Routes.needHelp,
        ),
      );
    }
    if (index == 2) {
      BlocProvider.of<NavigationBloc>(context).add(
        NavigationGoToPageEvent(
          page: Routes.helpList,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: _onItemTapped,
      items: [
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.handshake),
          title: Text('Need a hand'),
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.meh),
          title: Text('My Request'),
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.shoppingBasket),
          title: Text('Wanna help'),
        ),
      ],
    );
  }
}
