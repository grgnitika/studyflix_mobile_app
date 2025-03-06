// import 'package:bloc_test/bloc_test.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:studyflix/features/auth/presentation/view/register_view.dart';
// import 'package:studyflix/features/auth/presentation/view_model/signup/register_bloc.dart';

// // Mock RegisterBloc
// class MockRegisterBloc extends Mock implements RegisterBloc {}

// class FakeRegisterState extends Fake implements RegisterState {}

// class FakeRegisterEvent extends Fake implements RegisterEvent {}

// void main() {
//   late MockRegisterBloc mockRegisterBloc;

//   setUpAll(() {
//     registerFallbackValue(FakeRegisterState());
//     registerFallbackValue(FakeRegisterEvent());
//   });

//   setUp(() {
//     mockRegisterBloc = MockRegisterBloc();

//     // Mock initial state
//     when(() => mockRegisterBloc.state).thenReturn(RegisterState.initial());

//     // Mock stream behavior
//     when(() => mockRegisterBloc.stream)
//         .thenAnswer((_) => Stream.value(RegisterState.initial()));
//   });

//   Widget createTestWidget() {
//     return BlocProvider<RegisterBloc>.value(
//       value: mockRegisterBloc,
//       child: const MaterialApp(
//         home: RegisterView(),
//       ),
//     );
//   }

//   testWidgets('Should display "Register User" title',
//       (WidgetTester tester) async {
//     await tester.pumpWidget(createTestWidget());
//     await tester.pumpAndSettle();

//     debugPrint(tester.widgetList(find.byType(Text)).toString());

//     expect(find.text('Register User'), findsOneWidget);
//   });

//   testWidgets('Should find email, username, and password input fields',
//       (WidgetTester tester) async {
//     await tester.pumpWidget(createTestWidget());
//     await tester.pumpAndSettle();

//     expect(find.widgetWithText(TextFormField, 'Email'), findsOneWidget);
//     expect(find.widgetWithText(TextFormField, 'Username'), findsOneWidget);
//     expect(find.widgetWithText(TextFormField, 'Password'), findsOneWidget);
//   });

//   testWidgets('Should find the Register button', (WidgetTester tester) async {
//     await tester.pumpWidget(createTestWidget());
//     await tester.pumpAndSettle();

//     expect(find.widgetWithText(ElevatedButton, 'Register'), findsOneWidget);
//   });

//   testWidgets('Should show validation errors when submitting an empty form',
//       (WidgetTester tester) async {
//     await tester.pumpWidget(createTestWidget());
//     await tester.pumpAndSettle();

//     // Clear text fields to simulate empty form submission
//     await tester.enterText(find.byType(TextFormField).at(0), '');
//     await tester.enterText(find.byType(TextFormField).at(1), '');
//     await tester.enterText(find.byType(TextFormField).at(2), '');

//     // Tap on the Register button
//     Finder registerButton = find.widgetWithText(ElevatedButton, 'Register');
//     await tester.tap(registerButton);
//     await tester.pumpAndSettle();

//     // Check for validation messages
//     expect(find.text('Please enter your email'), findsOneWidget);
//     expect(find.text('Please enter username'), findsOneWidget);
//     expect(find.text('Please enter password'), findsOneWidget);
//   });

//   testWidgets('Should allow input and submit form without validation errors',
//       (WidgetTester tester) async {
//     await tester.pumpWidget(createTestWidget());
//     await tester.pumpAndSettle();

//     // Enter valid email
//     await tester.enterText(
//         find.widgetWithText(TextFormField, 'Email'), 'test@example.com');
//     await tester.pumpAndSettle();

//     // Enter valid username
//     await tester.enterText(
//         find.widgetWithText(TextFormField, 'Username'), 'testuser');
//     await tester.pumpAndSettle();

//     await tester.enterText(
//         find.widgetWithText(TextFormField, 'Password'), 'password123');
//     await tester.pumpAndSettle();

//     Finder registerButton = find.widgetWithText(ElevatedButton, 'Register');
//     await tester.tap(registerButton);
//     await tester.pumpAndSettle();

//     expect(find.text('Please enter your email'), findsNothing);
//     expect(find.text('Please enter username'), findsNothing);
//     expect(find.text('Please enter password'), findsNothing);
//   });

//   testWidgets('Should trigger RegisterUser event when clicking Register',
//       (WidgetTester tester) async {
//     await tester.pumpWidget(createTestWidget());
//     await tester.pumpAndSettle();

//     // Enter valid input
//     await tester.enterText(
//         find.widgetWithText(TextFormField, 'Email'), 'test@example.com');
//     await tester.enterText(
//         find.widgetWithText(TextFormField, 'Username'), 'testuser');
//     await tester.enterText(
//         find.widgetWithText(TextFormField, 'Password'), 'password123');
//     await tester.pumpAndSettle();

//     Finder registerButton = find.widgetWithText(ElevatedButton, 'Register');
//     await tester.tap(registerButton);
//     await tester.pumpAndSettle();

//     verify(() => mockRegisterBloc.add(
//           any(
//             that: isA<RegisterUser>()
//                 .having(
//                   (e) => e.email,
//                   'email',
//                   equals('test@example.com'),
//                 )
//                 .having(
//                   (e) => e.username,
//                   'username',
//                   equals('testuser'),
//                 )
//                 .having(
//                   (e) => e.password,
//                   'password',
//                   equals('password123'),
//                 ),
//           ),
//         )).called(1);
//   });

//   // testWidgets('Should show success message when registration is successful',
//   //     (WidgetTester tester) async {
//   //   when(() => mockRegisterBloc.stream).thenAnswer((_) => Stream.value(
//   //         const RegisterState(isLoading: false, isSuccess: true, imageName: ''),
//   //       ));
//   //   when(() => mockRegisterBloc.state).thenReturn(
//   //     const RegisterState(isLoading: false, isSuccess: true, imageName: ''),
//   //   );

//   //   await tester.pumpWidget(createTestWidget());
//   //   await tester.pumpAndSettle();

//   //   final BuildContext context = tester.element(find.byType(RegisterView));
//   //   ScaffoldMessenger.of(context).showSnackBar(
//   //     const SnackBar(content: Text('Registration Successful')),
//   //   );

//   //   await tester.pumpAndSettle();

//   //   expect(find.byType(SnackBar), findsOneWidget);

//   //   expect(find.text('Registration Successful'), findsOneWidget);
//   // });

//   testWidgets('Should navigate to login screen when registration is successful',
//       (WidgetTester tester) async {
//     whenListen(
//       mockRegisterBloc,
//       Stream.fromIterable([
//         const RegisterState(
//             isLoading: false, isSuccess: false, imageName: ''), // Initial state
//         const RegisterState(
//             isLoading: false,
//             isSuccess: true,
//             imageName: ''), // Simulate success
//       ]),
//     );

//     when(() => mockRegisterBloc.state).thenReturn(
//         const RegisterState(isLoading: false, isSuccess: false, imageName: ''));

//     await tester.pumpWidget(createTestWidget());
//     await tester.pumpAndSettle();

//     // Tap on the Register button
//     Finder registerButton = find.widgetWithText(ElevatedButton, 'Register');
//     await tester.tap(registerButton);
//     await tester.pump();

//     // Simulate successful registration
//     when(() => mockRegisterBloc.state).thenReturn(
//         const RegisterState(isLoading: false, isSuccess: true, imageName: ''));

//     await tester.pumpAndSettle();

//     // Ensure navigation occurs by checking the login screen text
//     expect(find.text('Login Screen'), findsOneWidget);
//   });

//   testWidgets('Should show error message when registration fails',
//       (WidgetTester tester) async {
//     when(() => mockRegisterBloc.state).thenReturn(
//       const RegisterState(isLoading: false, isSuccess: false, imageName: ''),
//     );
//     await tester.pumpWidget(createTestWidget());
//     await tester.pumpAndSettle();

//     expect(find.text('Registration failed. Please try again.'), findsOneWidget);
//   });
// }
