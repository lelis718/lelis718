import 'package:flutter_bloc/flutter_bloc.dart';

import '../navigation.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc();

  @override
  NavigationState get initialState => NavigationChangedState(Routes.home);

  @override
  Stream<NavigationState> mapEventToState(NavigationEvent event) async* {
    if (event is NavigationGoToHomeEvent) {
      yield NavigationChangedState(Routes.home);
    }
    if (event is NavigationGoToPageEvent) {
      yield NavigationChangedState(event.page);
    }
    if (event is NavigationPopEvent) {
      yield NavigationPoppedState();
    }
  }
}
