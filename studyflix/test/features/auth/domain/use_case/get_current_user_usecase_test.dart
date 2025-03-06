// import 'package:dartz/dartz.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:studyflix/core/error/failure.dart';
// import 'package:studyflix/features/auth/domain/entity/auth_entity.dart';
// import 'package:studyflix/features/auth/domain/repository/auth_repository.dart';
// import 'package:studyflix/features/auth/domain/use_case/get_current_user_usecase.dart';

// // Mock Repository
// class MockAuthRepository extends Mock implements IAuthRepository {}

// void main() {
//   late GetCurrentUserUseCase usecase;
//   late MockAuthRepository repository;

//   setUp(() {
//     repository = MockAuthRepository();
//     usecase = GetCurrentUserUseCase(authRepository: repository);
//   });

//   const tUser = AuthEntity(
//     userId: '1',
//     username: 'testUser',
//     email: 'test@example.com',
//     image: 'https://example.com/profile.jpg',
//     password: '',
//   );

//   test('should return current user when repository call is successful',
//       () async {
//     // Arrange
//     when(() => repository.getCurrentUser()).thenAnswer(
//       (_) async => const Right(tUser),
//     );

//     // Act
//     final result = await usecase();

//     // Assert
//     expect(result, const Right(tUser));
//     verify(() => repository.getCurrentUser()).called(1);
//     verifyNoMoreInteractions(repository);
//   });

//   test('should return a Failure when repository call fails', () async {
//     // Arrange
//     when(() => repository.getCurrentUser()).thenAnswer(
//       (_) async => const Left(ApiFailure(message: 'Failed to fetch user')),
//     );

//     // Act
//     final result = await usecase();

//     // Assert
//     expect(result, const Left(ApiFailure(message: 'Failed to fetch user')));
//     verify(() => repository.getCurrentUser()).called(1);
//     verifyNoMoreInteractions(repository);
//   });
// }
