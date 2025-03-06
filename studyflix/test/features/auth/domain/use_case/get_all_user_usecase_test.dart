// import 'package:dartz/dartz.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:studyflix/features/auth/domain/entity/auth_entity.dart';
// import 'package:studyflix/features/auth/domain/use_case/get_all_user_usecase.dart';

// import 'auth_repo.mock.dart';

// void main() {
//   late AuthRepoMock repository;
//   late GetAllUserUseCase useCase;

//   setUp(() {
//     repository = AuthRepoMock();
//     useCase = GetAllUserUseCase(authRepository: repository);
//   });

//   const tAuth = AuthEntity(
//     userId: '1',
//     username: 'sujala',
//     email: 'sjala@gmail.com',
//     password: 'sujala',
//   );

//   const tAuth2 = AuthEntity(
//     userId: '2',
//     username: 'sujala',
//     email: 'sjala@gmail.com',
//     password: 'sujala',
//   );
//   final tAuths = [tAuth, tAuth2];

//   test('should call the [AuthRepo.GetAllUser]', () async {
//     when(() => repository.getUser()).thenAnswer(
//       (_) async => Right(tAuths),
//     );
//     final result = await useCase();

//     expect(result, Right(tAuths));

//     verify(() => repository.getUser()).called(1);
//   });
// }
