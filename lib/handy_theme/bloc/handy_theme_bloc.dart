import 'package:flutter_bloc/flutter_bloc.dart';

import '../handy_theme.dart';

class HandyThemeBloc extends Bloc<HandyThemeEvent, HandyThemeState>{
  @override
  HandyThemeState get initialState => HandyThemeInitializeState();

  @override
  Stream<HandyThemeState> mapEventToState(HandyThemeEvent event) async* {
    if(event is HandyThemeUpdateTitleEvent){
      yield HandyThemeTitleUpdatedState(title: event.title);
    }
  }
  
}