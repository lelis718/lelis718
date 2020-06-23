import 'package:flutter/cupertino.dart';

import '../intro.dart';

class IntroCardList extends StatelessWidget {
  final List<CardInfo> cards;
  final void Function(int) onSwipeCard;

  const IntroCardList(
      {Key key, this.cards, this.onSwipeCard})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: _getIntroCards(),
    );
  }

  List<Widget> _getIntroCards() {
    double spacingMargin = 10;
    double currentMargin = 60;
    double alphaDecrease = 0.2;

    List<Widget> widgetCards = new List();
    cards.reversed.toList().asMap().forEach(
      (index, element) {
        widgetCards.add(
          Positioned(
            top: currentMargin,
            child: Draggable(
              onDragEnd: (drag) {
                print("Reloading cards...");
                onSwipeCard(0);
              },
              childWhenDragging: Container(),
              feedback: IntroCard(
                color: element.color,
                icon: element.icon,
                title: element.title,
                rotate: true,
              ),
              child: Opacity(
                opacity: (1.0 - ((cards.length - 1 - index) * alphaDecrease))
                    .clamp(0.0, 1.0),
                child: IntroCard(
                  color: element.color,
                  icon: element.icon,
                  title: element.title,
                  rotate: false,
                ),
              ),
            ),
          ),
        );
        currentMargin += spacingMargin;
      },
    );

    return widgetCards;
  }
}
