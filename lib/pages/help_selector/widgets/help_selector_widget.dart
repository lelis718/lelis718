import 'package:flutter/material.dart';
import 'package:handyclientapp/pages/help_selector/widgets/widgets.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text('What do you want to do?'),
        leading: Container(),
      ),
      body: Container(
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
      ),
      bottomNavigationBar: HelpSelectorNavigationBar(),
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
