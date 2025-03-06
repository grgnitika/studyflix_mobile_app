import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:studyflix/features/auth/presentation/view/login_view.dart';
import 'package:studyflix/features/auth/presentation/view_model/login/login_bloc.dart';

// Mock LoginBloc for testing
class MockLoginBloc extends Mock implements LoginBloc {}

void main() {
  testWidgets('Should have a title "Login"', (WidgetTester tester) async {
    // Create a mock LoginBloc
    final mockLoginBloc = MockLoginBloc();

    // Pump the widget with the mock LoginBloc
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<LoginBloc>(
          create: (context) => mockLoginBloc,
          child: LoginView(),
        ),
      ),
    );

    // Finder for the login title text
    final Finder titleFinder = find.text('Login');

    // Check if the title exists in the widget tree
    expect(titleFinder, findsOneWidget);
  });

  testWidgets('Should have email and password fields',
      (WidgetTester tester) async {
    // Create a mock LoginBloc
    final mockLoginBloc = MockLoginBloc();

    // Pump the widget with the mock LoginBloc
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<LoginBloc>(
          create: (context) => mockLoginBloc,
          child: LoginView(),
        ),
      ),
    );

    // Verify the presence of the email field
    expect(find.byKey(const ValueKey('email')), findsOneWidget);

    // Verify the presence of the password field
    expect(find.byKey(const ValueKey('password')), findsOneWidget);
  });

  testWidgets('Should have Login and Register buttons',
      (WidgetTester tester) async {
    // Create a mock LoginBloc
    final mockLoginBloc = MockLoginBloc();

    // Pump the widget with the mock LoginBloc
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<LoginBloc>(
          create: (context) => mockLoginBloc,
          child: LoginView(),
        ),
      ),
    );

    // Verify the presence of the Login button
    expect(find.text('Login'), findsOneWidget);

    // Verify the presence of the Register button
    expect(find.byKey(const ValueKey('registerButton')), findsOneWidget);
  });

  testWidgets('Should show validation errors for empty fields',
      (WidgetTester tester) async {
    // Create a mock LoginBloc
    final mockLoginBloc = MockLoginBloc();

    // Pump the widget with the mock LoginBloc
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<LoginBloc>(
          create: (context) => mockLoginBloc,
          child: LoginView(),
        ),
      ),
    );

    // Tap the Login button without entering any text
    await tester.tap(find.text('Login'));
    await tester.pump(); // Trigger validation

    // Verify that validation errors are shown
    expect(find.text('Please enter your email'), findsOneWidget);
    expect(find.text('Please enter your password'), findsOneWidget);
  });
}
