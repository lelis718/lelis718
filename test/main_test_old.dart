// import 'package:bloc_test/bloc_test.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:handyclientapp/main.dart';
// import 'package:handyclientapp/models/models.dart';
// import 'package:handyclientapp/pages/help_selector/widgets/need_help.dart';
// import 'package:handyclientapp/pages/help_selector/widgets/wanna_help.dart';
// import 'package:handyclientapp/pages/my_requests/widgets/help_request.dart';
// import 'package:handyclientapp/pages/need_help/request_sucess_confirmation.dart';
// import 'package:handyclientapp/pages/widgets/action_footer_button.dart';
// import 'package:handyclientapp/pages/widgets/loading.dart';
// import 'package:mockito/mockito.dart';
// import 'package:handyclientapp/pages/pages.dart';
// import 'package:handyclientapp/bloc/handy_bloc.dart';

// class HandyBlockMock extends MockBloc<HandyEvent, HandyState>
//     implements HandyBloc {}

// void main() {
//   HandyBloc bloc;

//   setUp(() {
//     bloc = HandyBlockMock();
//   });

//   tearDown(() {
//     bloc.close();
//   });

//   group('Main Widget', () {
//     testWidgets('Shows initializing message after no time',
//         (WidgetTester tester) async {
//       //Arrange
//       when(bloc.state).thenAnswer((_) => HandyInitializingState());

//       //Act
//       await tester.pumpWidget(HandyClient(handyBloc: bloc));

//       //Assert
//       expect(find.byType(SplashPage), findsOneWidget);
//       expect(find.text('Initializing...'), findsOneWidget);
//     });

//     testWidgets('Shows initializing message after 1 second',
//         (WidgetTester tester) async {
//       //Arrange
//       when(bloc.state).thenAnswer(
//         (_) => HandyInitializingState(
//           secondsToFinish: 1,
//         ),
//       );

//       //Act
//       await tester.pumpWidget(HandyClient(handyBloc: bloc));
//       await tester.pump(Duration(seconds: 1));

//       //Assert
//       expect(find.byType(SplashPage), findsOneWidget);
//       expect(find.text('Initializing...'), findsOneWidget);
//     });

//     testWidgets('Shows intro page', (WidgetTester tester) async {
//       //Arrange
//       when(bloc.state).thenAnswer(
//         (_) => HandyLoggedOutState(cards: [
//           CardInfo(
//               color: Colors.lightBlueAccent,
//               icon: Icons.ac_unit,
//               title: 'Bazinga')
//         ]),
//       );

//       //Act
//       await tester.pumpWidget(HandyClient(handyBloc: bloc));

//       //Assert
//       expect(find.byType(IntroPage), findsOneWidget);
//       expect(find.byType(Positioned), findsOneWidget);
//       expect(find.byType(Draggable), findsOneWidget);
//       expect(find.text('Handy'), findsOneWidget);
//     });

//     testWidgets('After drag the last card in intro calls the correct event',
//         (WidgetTester tester) async {
//       //Arrange
//       when(bloc.state).thenAnswer(
//         (_) => HandyLoggedOutState(cards: [
//           CardInfo(
//               color: Colors.lightBlueAccent,
//               icon: Icons.ac_unit,
//               title: 'Bazinga')
//         ]),
//       );

//       //Act
//       await tester.pumpWidget(HandyClient(handyBloc: bloc));
//       await tester.drag(find.byType(Positioned), Offset(500.0, 0.0));
//       await tester.pumpAndSettle();

//       //Assert
//       verify(
//         bloc.add(
//           HandyInitializedEvent(),
//         ),
//       ).called(1);
//     });

//     testWidgets('Shows help selector page', (WidgetTester tester) async {
//       //Arrange
//       when(bloc.state).thenAnswer((_) => HandyLoggedInState());

//       //Act
//       await tester.pumpWidget(HandyClient(handyBloc: bloc));

//       //Assert
//       expect(find.byType(HelpSelectorPage), findsOneWidget);
//       expect(find.byType(Scaffold), findsOneWidget);
//       expect(find.byType(AppBar), findsOneWidget);
//       expect(find.byType(Card), findsOneWidget);
//       expect(find.byType(Draggable), findsOneWidget);
//       expect(find.text('What do you want to do?'), findsOneWidget);
//       expect(find.byType(NeedHelp), findsOneWidget);
//       expect(find.byType(WannaHelp), findsOneWidget);
//       expect(find.byType(ActionFooterButton), findsNWidgets(3));
//       expect(find.text('Request Help'), findsOneWidget);
//       expect(find.text('My requests'), findsOneWidget);
//       expect(find.text('Help Someone'), findsOneWidget);
//     });

//     testWidgets('Drag right in help selector page calls correct event',
//         (WidgetTester tester) async {
//       //Arrange
//       when(bloc.state).thenAnswer((_) => HandyLoggedInState());

//       //Act
//       await tester.pumpWidget(HandyClient(handyBloc: bloc));
//       await tester.drag(find.byType(Card), Offset(500.0, 0.0));
//       await tester.pumpAndSettle();

//       //Assert
//       verify(
//         bloc.add(
//           NeedHelpEvent(),
//         ),
//       ).called(1);
//     });

//     testWidgets('Drag left in help selector page calls correct event',
//         (WidgetTester tester) async {
//       //Arrange
//       when(bloc.state).thenAnswer((_) => HandyLoggedInState());

//       //Act
//       await tester.pumpWidget(HandyClient(handyBloc: bloc));
//       await tester.drag(find.byType(Card), Offset(-500.0, 0.0));
//       await tester.pumpAndSettle();

//       //Assert
//       verify(
//         bloc.add(
//           WantToHelpEvent(),
//         ),
//       ).called(1);
//     });

//     testWidgets(
//         'Tap request help button in help selector page calls correct event',
//         (WidgetTester tester) async {
//       //Arrange
//       when(bloc.state).thenAnswer((_) => HandyLoggedInState());

//       //Act
//       await tester.pumpWidget(HandyClient(handyBloc: bloc));
//       await tester.tap(find.byKey(Key('ActionFooter_RequestHelp')));
//       await tester.pump();

//       //Assert
//       verify(
//         bloc.add(
//           NeedHelpEvent(),
//         ),
//       ).called(1);
//     });

//     testWidgets(
//         'Tap my request button in help selector page calls correct event',
//         (WidgetTester tester) async {
//       //Arrange
//       when(bloc.state).thenAnswer((_) => HandyLoggedInState());

//       //Act
//       await tester.pumpWidget(HandyClient(handyBloc: bloc));
//       await tester.tap(find.byKey(Key('ActionFooter_MyRequest')));
//       await tester.pump();

//       //Assert
//       verify(
//         bloc.add(
//           MyRequestsEvent(),
//         ),
//       ).called(1);
//     });

//     testWidgets(
//         'Tap request someone button in help selector page calls correct event',
//         (WidgetTester tester) async {
//       //Arrange
//       when(bloc.state).thenAnswer((_) => HandyLoggedInState());

//       //Act
//       await tester.pumpWidget(HandyClient(handyBloc: bloc));
//       await tester.tap(find.byKey(Key('ActionFooter_HelpSomeone')));
//       await tester.pump();

//       //Assert
//       verify(
//         bloc.add(
//           WantToHelpEvent(),
//         ),
//       ).called(1);
//     });

//     testWidgets('Shows load widget', (WidgetTester tester) async {
//       //Arrange
//       when(bloc.state).thenAnswer(
//         (_) => LoadState(),
//       );

//       //Act
//       await tester.pumpWidget(HandyClient(handyBloc: bloc));

//       //Assert
//       expect(find.byType(Loading), findsOneWidget);
//       expect(find.text('Loading...'), findsOneWidget);
//     });

//     testWidgets('Shows want to help page', (WidgetTester tester) async {
//       //Arrange
//       when(bloc.state).thenAnswer(
//         (_) => WantToHelpState(
//           helpRequests: [
//             Help(message: 'Bazinga', user: 'bazingaUser'),
//           ],
//         ),
//       );

//       //Act
//       await tester.pumpWidget(HandyClient(handyBloc: bloc));

//       //Assert
//       expect(find.byType(HelpListPage), findsOneWidget);
//       expect(find.byType(Scaffold), findsOneWidget);
//       expect(find.byType(AppBar), findsOneWidget);
//       expect(find.byType(Positioned), findsOneWidget);
//       expect(find.text('Swipe cards to give a hand'), findsOneWidget);
//       expect(find.text('Bazinga'), findsOneWidget);
//     });

//     testWidgets('After drag the last help card calls the correct event',
//         (WidgetTester tester) async {
//       //Arrange
//       final helpRequests = [Help(message: 'Bazinga', user: 'bazingaUser')];

//       when(bloc.state).thenAnswer(
//         (_) => WantToHelpState(
//           helpRequests: helpRequests,
//         ),
//       );

//       //Act
//       await tester.pumpWidget(HandyClient(handyBloc: bloc));
//       await tester.drag(find.byType(Positioned), Offset(500.0, 0.0));
//       await tester.pumpAndSettle();

//       //Assert
//       verify(
//         bloc.add(
//           StartChatEvent(help: helpRequests.first),
//         ),
//       ).called(1);
//     });

//     testWidgets('Shows need help page', (WidgetTester tester) async {
//       //Arrange
//       when(bloc.state).thenAnswer(
//         (_) => NeedHelpState(
//           deviceInfo: DeviceInfo(),
//         ),
//       );

//       //Act
//       await tester.pumpWidget(HandyClient(handyBloc: bloc));

//       //Assert
//       expect(find.byType(NeedHelpPage), findsOneWidget);
//       expect(find.text('What needs to be done?'), findsOneWidget);
//       expect(find.byType(TextFormField), findsOneWidget);
//       expect(find.byKey(Key('NeedHelpPage_RaisedButton_Back')), findsOneWidget);
//       expect(find.byKey(Key('NeedHelpPage_RaisedButton_Ask')), findsOneWidget);
//       expect(find.byType(TextFormField), findsOneWidget);
//       expect(find.byType(RaisedButton), findsNWidgets(2));
//       expect(find.text('Ask Help'), findsOneWidget);
//       expect(find.text('Back'), findsOneWidget);
//     });

//     testWidgets('Back button in need help page calls the correct event',
//         (WidgetTester tester) async {
//       //Arrange
//       when(bloc.state).thenAnswer(
//         (_) => NeedHelpState(
//           deviceInfo: DeviceInfo(),
//         ),
//       );

//       //Act
//       await tester.pumpWidget(HandyClient(handyBloc: bloc));
//       await tester.tap(find.byKey(Key('NeedHelpPage_RaisedButton_Back')));
//       await tester.pump();

//       //Assert
//       verify(
//         bloc.add(
//           HandyInitializedEvent(),
//         ),
//       ).called(1);
//     });

//     testWidgets('Try to ask Help button without provide a text',
//         (WidgetTester tester) async {
//       //Arrange
//       when(bloc.state).thenAnswer(
//         (_) => NeedHelpState(
//           deviceInfo: DeviceInfo(),
//         ),
//       );

//       //Act
//       await tester.pumpWidget(HandyClient(handyBloc: bloc));
//       await tester.tap(find.byKey(Key('NeedHelpPage_RaisedButton_Ask')));
//       await tester.pump();

//       //Assert
//       expect(find.text('We need to know what do you neeed'), findsOneWidget);
//       verifyNever(
//         bloc.add(
//           HandyInitializedEvent(),
//         ),
//       );
//     });

//     testWidgets('Shows request sent confirmation', (WidgetTester tester) async {
//       //Arrange
//       when(bloc.state).thenAnswer(
//         (_) => RequestSentState(isSuccess: true),
//       );

//       //Act
//       await tester.pumpWidget(HandyClient(handyBloc: bloc));

//       //Assert
//       expect(find.byType(RequestSucessConfirmation), findsOneWidget);
//       expect(find.byType(Scaffold), findsOneWidget);
//       expect(find.byType(AlertDialog), findsOneWidget);
//       expect(find.text('Help posted with successfully'), findsOneWidget);
//       expect(find.text('Alert Dialog body'), findsOneWidget);
//       expect(find.text('Close'), findsOneWidget);
//     });

//     testWidgets('After sent confirmation close button calls the correct event',
//         (WidgetTester tester) async {
//       //Arrange
//       when(bloc.state).thenAnswer(
//         (_) => RequestSentState(isSuccess: true),
//       );

//       //Act
//       await tester.pumpWidget(HandyClient(handyBloc: bloc));
//       await tester
//           .tap(find.byKey(Key('RequestSucessConfirmation_AlertDialog')));
//       await tester.pump();

//       //Assert
//       verify(
//         bloc.add(
//           HandyInitializedEvent(),
//         ),
//       ).called(1);
//     });

//     testWidgets('Shows chat page', (WidgetTester tester) async {
//       //Arrange
//       when(bloc.state).thenAnswer(
//         (_) => StartChatState(
//           deviceInfo: DeviceInfo(hasLoggedIn: true, uuid: 'a'),
//           help: Help(id: '1', message: '2', user: '3'),
//           messages: [
//             ChatMessage(date: DateTime.now(), message: 'd', userId: '4'),
//             ChatMessage(date: DateTime.now(), message: 'e', userId: 'a')
//           ],
//         ),
//       );

//       //Act
//       await tester.pumpWidget(HandyClient(handyBloc: bloc));

//       //Assert
//       expect(find.byType(ChatPage), findsOneWidget);
//     });

//     testWidgets('Back button in chat page calls the correct event',
//         (WidgetTester tester) async {
//       when(bloc.state).thenAnswer(
//         (_) => StartChatState(
//           deviceInfo: DeviceInfo(hasLoggedIn: true, uuid: 'a'),
//           help: Help(id: '1', message: '2', user: '3'),
//           messages: [
//             ChatMessage(date: DateTime.now(), message: 'd', userId: '4'),
//             ChatMessage(date: DateTime.now(), message: 'e', userId: 'a')
//           ],
//         ),
//       );

//       //Act
//       await tester.pumpWidget(HandyClient(handyBloc: bloc));
//       await tester.tap(find.byKey(Key('ChatPage_IconButton_Back')));
//       await tester.pump();

//       //Assert
//       verify(
//         bloc.add(
//           HandyInitializedEvent(),
//         ),
//       ).called(1);
//     });

//     testWidgets('Shows my help requests pages', (WidgetTester tester) async {
//       //Arrange
//       when(bloc.state).thenAnswer(
//         (_) => MyRequestsState(helpRequests: [
//           Help(message: 'Bazinga', user: 'bazingaUser'),
//         ]),
//       );

//       //Act
//       await tester.pumpWidget(HandyClient(handyBloc: bloc));

//       //Assert
//       expect(find.byType(MyRequestsPage), findsOneWidget);
//       expect(find.text('Manage your requests'), findsOneWidget);
//       expect(find.byType(HelpRequest), findsOneWidget);
//       expect(find.byType(FaIcon), findsNWidgets(4));
//     });
//   });
// }
