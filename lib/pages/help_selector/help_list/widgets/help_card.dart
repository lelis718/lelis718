import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../help_list.dart';

class HelpCard {
  String description = "";
  String user = "";

  HelpCard(Help help) {
    this.description = help.message;
    this.user = help.user;
  }

  Widget drawCard(bool rotate) {
    return Container(
      transform: rotate ? Matrix4.rotationZ(-0.05) : null,
      child: Card(
        elevation: 12,
        color: Colors.lightBlueAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          alignment: Alignment.center,
          width: 350,
          height: 380,
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(top: 40, bottom: 10),
                child: FaIcon(
                  FontAwesomeIcons.handPaper,
                  color: Colors.white,
                  size: 30.0,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(25),
                height: 280,
                child: Center(
                  child: Text(
                    description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
