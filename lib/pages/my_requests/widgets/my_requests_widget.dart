import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../my_requests.dart';

class MyRequestsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyRequestsBloc, MyRequestsState>(
      builder: (context, state) {
        if(state is MyRequestsInitalizeState){
          context.bloc<MyRequestsBloc>().add(MyRequestsLoadEvent());
        }
        if(state is MyRequestsLoadedState){
          return MyRequestsPage(helpRequests:state.helpRequests);
        }
        return Container();
      },
    );
  }
}
