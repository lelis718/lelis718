import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handyclientapp/models/models.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();
}

class NavigateToHome extends MainEvent {
  @override
  List<Object> get props => null;
}

class NavigateToPage extends MainEvent {
  final String page;
  NavigateToPage({this.page});
  @override
  List<Object> get props => [page];
}

class NavigationPop extends MainEvent {
  @override
  List<Object> get props => null;
}

abstract class MainState extends Equatable {}

class NavigationChanged extends MainState {
  final String route;
  NavigationChanged(this.route);
  @override
  List<Object> get props => [route];
}

class NavigationPopped extends MainState {
  @override
  List<Object> get props => null;
}

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc();

  @override
  MainState get initialState => NavigationChanged(PageRoutes.home);

  @override
  Stream<MainState> mapEventToState(MainEvent event) async* {
    if (event is NavigateToPage) {
      yield NavigationChanged(event.page);
    } else if (event is NavigationPop) {
      yield NavigationPopped();
    }
  }
}
