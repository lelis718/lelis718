import 'package:flutter_bloc/flutter_bloc.dart';

import '../help_selector.dart';

class HelpSelectorBloc extends Bloc<HelpSelectorEvent, HelpSelectorState>{
  @override
  HelpSelectorState get initialState => HelpSelectorHandyLoggedInState();

  @override
  Stream<HelpSelectorState> mapEventToState(HelpSelectorEvent event) {
    return null;
  }

}