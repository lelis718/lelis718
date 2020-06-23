import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handyclientapp/handy_theme/handy_theme.dart';

import 'need_help.dart';
import 'wanna_help.dart';

class HelpSelectorWidget extends StatelessWidget {
  final VoidCallback onSwipeLeft;
  final VoidCallback onSwipeRight;
  final VoidCallback onRequestHelpTap;
  final VoidCallback onMyRequestsTap;
  final VoidCallback onHelpSomeoneTap;

  const HelpSelectorWidget({
    this.onSwipeLeft,
    this.onSwipeRight,
    this.onRequestHelpTap,
    this.onMyRequestsTap,
    this.onHelpSomeoneTap,
  });

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HandyThemeBloc>(context)
        .add(HandyThemeUpdateTitleEvent(title: "What do you want to do?"));

    return Container(
      color: Colors.white,
      child: Center(
        child: Draggable(
          onDragEnd: (drag) {
            if (drag.offset.dx.abs() > 30) {
              var isDragRight = drag.offset.dx > 0;
              if (isDragRight) {
                onSwipeRight();
              } else {
                onSwipeLeft();
              }
            }
          },
          childWhenDragging: Container(),
          feedback: _buildCard(),
          child: _buildCard(),
        ),
      ),
    );
  }

  Card _buildCard() {
    return Card(
      elevation: 12,
      color: Colors.lightBlueAccent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        alignment: Alignment.center,
        width: 350,
        height: 350,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Expanded(child: NeedHelp()),
            Expanded(child: WannaHelp()),
          ],
        ),
      ),
    );
  }
}
