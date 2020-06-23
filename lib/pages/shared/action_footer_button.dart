import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ActionFooterButton extends StatelessWidget {
  final VoidCallback onTap;

  final String textButton;
  final IconData iconButton;

  ActionFooterButton({
    Key key,
    this.textButton,
    this.iconButton,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            children: <Widget>[
              FaIcon(this.iconButton, color: Colors.lightBlueAccent),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  this.textButton,
                  style: TextStyle(color: Colors.lightBlueAccent),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
