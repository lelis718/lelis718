
import 'package:equatable/equatable.dart';

abstract class IntroEvent extends Equatable {
  const IntroEvent();
}

class IntroLoadCardsEvent extends IntroEvent{
  @override
  List<Object> get props => null;
}
class IntroRemoveCardEvent extends IntroEvent{

  final int cardIndex;
  IntroRemoveCardEvent({this.cardIndex});

  @override
  List<Object> get props => [cardIndex];

}


