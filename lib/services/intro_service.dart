import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:handyclientapp/pages/home/intro/intro.dart';

abstract class IntroService {
  List<CardInfo> resetAndGetCards();
  List<CardInfo> removeAndGetCards(int index);
}

class IntroServiceDefault extends IntroService {
  List<CardInfo> currentCards = List();

  List<CardInfo> resetAndGetCards() {
    currentCards = List();
    currentCards.add(
      new CardInfo(
        title: "Welcome to Handy!",
        icon: FontAwesomeIcons.smileBeam,
        color: Colors.lightBlueAccent,
      ),
    );
    currentCards.add(
      new CardInfo(
        title: "Need some help?",
        icon: FontAwesomeIcons.questionCircle,
        color: Colors.lightBlueAccent,
      ),
    );
    currentCards.add(
      new CardInfo(
        title: "Add local and what you are planning to do",
        icon: FontAwesomeIcons.searchLocation,
        color: Colors.lightBlueAccent,
      ),
    );
    currentCards.add(
      new CardInfo(
        title: "Someone will receive your request to give you a hand!",
        icon: FontAwesomeIcons.smileWink,
        color: Colors.lightBlueAccent,
      ),
    );
    currentCards.add(
      new CardInfo(
        title: "Want to help someone?",
        icon: FontAwesomeIcons.peopleCarry,
        color: Colors.lightBlueAccent,
      ),
    );
    currentCards.add(
      new CardInfo(
        title: "Swipe between the cards for give a hand to someone. ",
        icon: FontAwesomeIcons.arrowsAltH,
        color: Colors.lightBlueAccent,
      ),
    );
    currentCards.add(
      new CardInfo(
        title: "Shall we begin?",
        icon: FontAwesomeIcons.smileBeam,
        color: Colors.lightBlueAccent,
      ),
    );

    return currentCards;
  }

  @override
  List<CardInfo> removeAndGetCards(int index) {
    if (index >= 0 && index < this.currentCards.length)
      this.currentCards.removeAt(index);
    return this.currentCards;
  }
}
