// import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:studyflix/features/auth/domain/use_case/login_usecase.dart';
// import 'package:studyflix/features/auth/presentation/view_model/login/login_bloc.dart';
// import 'package:studyflix/features/auth/presentation/view_model/signup/register_bloc.dart';
// import 'package:studyflix/features/home/presentation/view/home_view.dart';

// class MockRegisterBloc extends Mock implements RegisterBloc {}

// class MockLoginUseCase extends Mock implements LoginUseCase {}

// class FakeLoginParams extends Fake implements LoginParams {
//   @override
//   String get username => "testUser";

//   @override
//   String get password => "testPass";
// }

// class MockBuildContext extends Mock implements BuildContext {}

// void main() {
//   late LoginBloc loginBloc;
//   late MockRegisterBloc mockRegisterBloc;
//   late MockLoginUseCase mockLoginUseCase;

//   setUpAll(() {
//     registerFallbackValue(FakeLoginParams());
//   });

//   setUp(() {
//     EquatableConfig.stringify = true; // Enable better debugging

//     mockRegisterBloc = MockRegisterBloc();
//     mockLoginUseCase = MockLoginUseCase();

//     loginBloc = LoginBloc(
//       registerBloc: mockRegisterBloc,
//       loginUseCase: mockLoginUseCase,
//     );
//   });

//   tearDown(() {
//     loginBloc.close();
//   });

//   test('Initial state should be LoginState.initial()', () {
//     expect(loginBloc.state.isLoading, false);
//     expect(loginBloc.state.isSuccess, false);
//   });

//   testWidgets('Navigating to Register Screen should not crash', (tester) async {
//     await tester.pumpWidget(MaterialApp(
//       home: Builder(
//         builder: (context) {
//           loginBloc.add(
//             NavigateRegisterScreenEvent(
//               context: context,
//               destination: Container(),
//             ),
//           );
//           return Container();
//         },
//       ),
//     ));
//   });

//   testWidgets('Navigating to Home Screen should not crash', (tester) async {
//     await tester.pumpWidget(MaterialApp(
//       home: Builder(
//         builder: (context) {
//           loginBloc.add(
//             NavigateHomeScreenEvent(
//               context: context,
//               destination: Container(),
//             ),
//           );
//           return Container();
//         },
//       ),
//     ));
//   });

//   testWidgets(
//       'Navigates to Register screen when NavigateRegisterScreenEvent is added',
//       (WidgetTester tester) async {
//     await tester.pumpWidget(
//       MaterialApp(
//         home: BlocProvider.value(
//           value: loginBloc,
//           child: Builder(
//             builder: (context) {
//               return ElevatedButton(
//                 key: const Key('testNavigateRegisterButton'),
//                 onPressed: () {
//                   loginBloc.add(
//                     NavigateRegisterScreenEvent(
//                       context: context,
//                       destination:
//                           Container(), // Replace with your actual destination widget
//                     ),
//                   );
//                 },
//                 child: const Text('Navigate to Register'),
//               );
//             },
//           ),
//         ),
//       ),
//     );

//     // Simulate button press to trigger navigation
//     await tester.tap(find.byKey(const Key('testNavigateRegisterButton')));
//     await tester.pumpAndSettle();

//     // Verify navigation to register screen
//     expect(find.byType(Container),
//         findsOneWidget); // Verify that the destination widget is rendered
//   });

//   testWidgets('Navigates to Home screen when NavigateHomeScreenEvent is added',
//       (WidgetTester tester) async {
//     await tester.pumpWidget(
//       MaterialApp(
//         home: BlocProvider.value(
//           value: loginBloc,
//           child: Builder(
//             builder: (context) {
//               return ElevatedButton(
//                 key: const Key('testNavigateHomeButton'),
//                 onPressed: () {
//                   loginBloc.add(
//                     NavigateHomeScreenEvent(
//                       context: context,
//                       destination: const HomeView(),
//                     ),
//                   );
//                 },
//                 child: const Text('Navigate to Home'),
//               );
//             },
//           ),
//         ),
//       ),
//     );

//     // Simulate button press to trigger navigation
//     await tester.tap(find.byKey(const Key('testNavigateHomeButton')));
//     await tester.pumpAndSettle();

//     // Verify navigation to home screen
//     expect(find.byType(HomeView),
//         findsOneWidget); // Verify that the HomeView widget is rendered
//   });
// }
