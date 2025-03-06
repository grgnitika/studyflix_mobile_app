// import 'package:dartz/dartz.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:studyflix/core/error/failure.dart';
// import 'package:studyflix/features/auth/domain/use_case/login_usecase.dart';

// import 'auth_repo.mock.dart';
// import 'token.mock.dart';

// void main() {
//   late AuthRepoMock repository;
//   late MockTokenSharedPrefs tokenSharedPrefs;
//   late LoginUseCase usecase;

//   setUp(() {
//     repository = AuthRepoMock();
//     tokenSharedPrefs = MockTokenSharedPrefs();
//     usecase = LoginUseCase(repository, tokenSharedPrefs);

//     // Register fallback values for Mocktail
//     registerFallbackValue(const LoginParams(email: '', password: ''));
//   });

//   test(
//       'should call the [AuthRepo.login] with correct username and password(sujala, sujala123)',
//       () async {
//     // Arrange
//     const email = 'sujala@gmail.com';
//     const password = 'sujala123';
//     const token = 'token';

//     when(() => repository.loginUser(any(), any()))
//         .thenAnswer((invocation) async {
//       final username = invocation.positionalArguments[0] as String;
//       final password = invocation.positionalArguments[1] as String;
//       if (username == 'sujala' && password == 'sujala123') {
//         return const Right(token); // Return the token
//       } else {
//         return const Left(ApiFailure(message: 'Invalid user name or password'));
//       }
//     });

//     when(() => tokenSharedPrefs.saveToken(any()))
//         .thenAnswer((_) async => const Right(null));

//     // Act
//     final result = await usecase(const LoginParams(
//       email: email,
//       password: password,
//     ));

//     // Assert
//     expect(result, const Right(token));

//     verify(() => repository.loginUser(email, password)).called(1);
//     verify(() => tokenSharedPrefs.saveToken(token)).called(1);

//     verifyNoMoreInteractions(repository);
//     verifyNoMoreInteractions(tokenSharedPrefs);
//   });

//   tearDown(() {
//     reset(repository);
//     reset(tokenSharedPrefs);
//   });
// }
