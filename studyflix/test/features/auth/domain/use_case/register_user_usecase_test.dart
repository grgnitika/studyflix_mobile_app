import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:studyflix/core/error/failure.dart';
import 'package:studyflix/features/auth/domain/entity/auth_entity.dart';
import 'package:studyflix/features/auth/domain/repository/auth_repository.dart';
import 'package:studyflix/features/auth/domain/use_case/register_user_usecase.dart';

class AuthRepoMock extends Mock implements IAuthRepository {}

void main() {
  late AuthRepoMock repository;
  late RegisterUseCase usecase;

  setUp(() {
    repository = AuthRepoMock();
    usecase = RegisterUseCase(repository);
    registerFallbackValue(
      const AuthEntity(
        email: 'test@example.com',
        username: 'testUser',
        password: 'password123',
        image: null,
        role: 'user',
      ),
    );
  });

  const params = RegisterUserParams(
    email: 'test@example.com',
    username: 'testUser',
    password: 'password123',
    image: null,
    role: 'user',
  );

  test('should call the [AuthRepo.registerUser] and return Right(null)',
      () async {
    when(() => repository.registerUser(any())).thenAnswer(
      (_) async => const Right(null),
    );

    final result = await usecase(params);

    expect(result, const Right(null));

    verify(() => repository.registerUser(any())).called(1);

    verifyNoMoreInteractions(repository);
  });

  test('should return [Failure] when registration fails', () async {
    const failure = ApiFailure(message: 'Registration failed');

    when(() => repository.registerUser(any())).thenAnswer(
      (_) async => const Left(failure),
    );

    final result = await usecase(params);

    expect(result, const Left(failure));

    verify(() => repository.registerUser(any())).called(1);
    verifyNoMoreInteractions(repository);
  });
}
