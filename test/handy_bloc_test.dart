// import 'package:bloc_test/bloc_test.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:handyclientapp/bloc/handy_bloc.dart';
// import 'package:handyclientapp/models/models.dart';
// import 'package:handyclientapp/services/services.dart';
// import 'package:mockito/mockito.dart';

// class MockDeviceInfoService extends Mock implements DeviceInfoService {}

// class MockHelpService extends Mock implements HelpService {}

// class MockIntroService extends Mock implements IntroService {}

// void main() {
//   group('Handy bloc', () {
//     HandyBloc handyBloc;
//     final deviceInfoService = MockDeviceInfoService();
//     final helpService = MockHelpService();
//     final introService = MockIntroService();

//     final defaultSecondsToFinish = 3;
//     final cardsInfo = [
//       CardInfo(color: Colors.orange, icon: Icons.ac_unit, title: 'Bazinga')
//     ];

//     final helpRequests = [Help(message: 'Bazinga', user: 'DoubleBazinga')];
//     final deviceUserLoggedIn = DeviceInfo(hasLoggedIn: true, uuid: '1');
//     final deviceUserNotLoggedIn = DeviceInfo(hasLoggedIn: false);

//     final chatMessages = [
//       ChatMessage(date: DateTime.now(), message: 'a', userId: 'b')
//     ];

//     setUp(() {
//       handyBloc = HandyBloc(
//         deviceInfoService: deviceInfoService,
//         helpService: helpService,
//         introService: introService,
//       );
//     });

//     tearDown(() {
//       handyBloc.close();
//     });

//     test('Initial state is Loading', () {
//       expect(
//         handyBloc.initialState,
//         HandyInitializingState(secondsToFinish: defaultSecondsToFinish),
//       );
//     });

//     blocTest(
//       'On the re initializing',
//       build: () {
//         when(deviceInfoService.getDeviceInfo()).thenAnswer(
//           (_) => Future.value(deviceUserLoggedIn),
//         );
//         return handyBloc;
//       },
//       act: (bloc) => bloc.add(HandyInitializingEvent()),
//       expect: [
//         HandyInitializingState(secondsToFinish: defaultSecondsToFinish),
//         HandyInitializingState()
//       ],
//     );

//     blocTest(
//       'Initialize the app with user logged in',
//       build: () {
//         when(deviceInfoService.getDeviceInfo()).thenAnswer(
//           (_) => Future.value(deviceUserLoggedIn),
//         );
//         return handyBloc;
//       },
//       act: (bloc) => bloc.add(HandyInitializedEvent()),
//       expect: [
//         HandyInitializingState(secondsToFinish: defaultSecondsToFinish),
//         HandyLoggedInState()
//       ],
//     );

//     blocTest(
//       'Initialize the app with user is not logged yet',
//       build: () {
//         when(introService.getCards()).thenAnswer((_) => cardsInfo);
//         when(deviceInfoService.getDeviceInfo()).thenAnswer(
//           (_) => Future.value(deviceUserNotLoggedIn),
//         );
//         return handyBloc;
//       },
//       act: (bloc) => bloc.add(HandyInitializedEvent()),
//       expect: [
//         HandyInitializingState(secondsToFinish: defaultSecondsToFinish),
//         HandyLoggedOutState(cards: cardsInfo)
//       ],
//     );

//     blocTest(
//       'When the user want help someone else',
//       build: () {
//         when(deviceInfoService.getDeviceInfo()).thenAnswer(
//           (_) => Future.value(deviceUserLoggedIn),
//         );

//         when(helpService.getOtherHelpRequests('1'))
//             .thenAnswer((_) => Future.value(helpRequests));
//         return handyBloc;
//       },
//       act: (bloc) => bloc.add(WantToHelpEvent()),
//       expect: [
//         HandyInitializingState(secondsToFinish: defaultSecondsToFinish),
//         LoadState(),
//         WantToHelpState(helpRequests: helpRequests)
//       ],
//     );

//     blocTest(
//       'When the user needs help',
//       build: () {
//         when(deviceInfoService.getDeviceInfo()).thenAnswer(
//           (_) => Future.value(deviceUserLoggedIn),
//         );
//         return handyBloc;
//       },
//       act: (bloc) => bloc.add(NeedHelpEvent()),
//       expect: [
//         HandyInitializingState(secondsToFinish: defaultSecondsToFinish),
//         NeedHelpState(deviceInfo: deviceUserLoggedIn),
//       ],
//     );

//     blocTest(
//       'When the user sends the help request',
//       build: () {
//         when(helpService.askHelp(Help())).thenAnswer(
//           (_) => Future.value(true),
//         );
//         return handyBloc;
//       },
//       act: (bloc) => bloc.add(SendRequestEvent(helpRequest: Help())),
//       expect: [
//         HandyInitializingState(secondsToFinish: defaultSecondsToFinish),
//         RequestSentState(isSuccess: true),
//       ],
//     );

//     blocTest(
//       'When the user starts the Chat',
//       build: () {
//         when(deviceInfoService.getDeviceInfo()).thenAnswer(
//           (_) => Future.value(deviceUserLoggedIn),
//         );

//         when(helpService.getChatMessages()).thenAnswer(
//           (_) => chatMessages,
//         );
//         return handyBloc;
//       },
//       act: (bloc) => bloc.add(StartChatEvent(help: helpRequests.first)),
//       expect: [
//         HandyInitializingState(secondsToFinish: defaultSecondsToFinish),
//         StartChatState(
//             help: helpRequests.first,
//             messages: chatMessages,
//             deviceInfo: deviceUserLoggedIn)
//       ],
//     );

//     blocTest(
//       'When the user wants to see their requests',
//       build: () {
//         when(deviceInfoService.getDeviceInfo()).thenAnswer(
//           (_) => Future.value(DeviceInfo(uuid: 'BazingaUser')),
//         );

//         when(helpService.getMyHelpRequests('BazingaUser')).thenAnswer(
//           (_) => Future.value(helpRequests),
//         );
//         return handyBloc;
//       },
//       act: (bloc) => bloc.add(MyRequestsEvent()),
//       expect: [
//         HandyInitializingState(secondsToFinish: defaultSecondsToFinish),
//         LoadState(),
//         MyRequestsState(helpRequests: helpRequests)
//       ],
//     );
//   });
// }
