// import 'package:dartz/dartz.dart';
// import 'package:equatable/equatable.dart';
// import 'package:studyflix/app/shared_prefs/token_shared_prefs.dart';
// import 'package:studyflix/app/usecase/usecase.dart';
// import 'package:studyflix/core/error/failure.dart';
// import 'package:studyflix/features/auth/domain/repository/auth_repository.dart';

// class LoginParams extends Equatable {
//   final String email;
//   final String password;

//   const LoginParams({
//     required this.email,
//     required this.password,
//   });

//   // Initial Constructor
//   const LoginParams.initial()
//       : email = '',
//         password = '';

//   @override
//   List<Object> get props => [email, password];
// }

// class LoginUseCase implements UsecaseWithParams<String, LoginParams> {
//   final IAuthRepository repository;
//   final TokenSharedPrefs tokenSharedPrefs;

//   LoginUseCase(this.repository, this.tokenSharedPrefs);

//   @override
//   Future<Either<Failure, String>> call(LoginParams params) {
//     // Save token in Shared Preferences
//     return repository.loginUser(params.email, params.password).then((value) {
//       return value.fold(
//         (failure) => Left(failure),
//         (token) {
//           tokenSharedPrefs.saveToken(token);
//           tokenSharedPrefs.getToken().then((value) {
//             print(value);
//           });
//           return Right(token);
//         },
//       );
//     });
//   }
// }

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:studyflix/app/shared_prefs/token_shared_prefs.dart';
import 'package:studyflix/app/usecase/usecase.dart';
import 'package:studyflix/core/error/failure.dart';
import 'package:studyflix/features/auth/domain/repository/auth_repository.dart';

class LoginParams extends Equatable {
  final String email;
  final String password;

  const LoginParams({
    required this.email,
    required this.password,
  });

  // Initial Constructor
  const LoginParams.initial()
      : email = '',
        password = '';

  @override
  List<Object> get props => [email, password];
}

class LoginUseCase implements UsecaseWithParams<String, LoginParams> {
  final IAuthRepository repository;
  final TokenSharedPrefs tokenSharedPrefs;

  LoginUseCase(this.repository, this.tokenSharedPrefs);

  @override
  // Future<Either<Failure, String>> call(LoginParams params) {
  //   return repository.loginUser(params.email, params.password).then((value) {
  //     return value.fold(
  //       (failure) => Left(failure),
  //       (token) {
  //         tokenSharedPrefs.saveToken(token);
  //         return Right(token);
  //       },
  //     );
  //   });
  Future<Either<Failure, String>> call(LoginParams params) async {
    final result = await repository.loginUser(params.email, params.password);
    return result.fold(
      (failure) {
        print("Login failed: ${failure.message}");
        return Left(failure);
      },
      (token) {
        print("Login successful, token: $token");
        tokenSharedPrefs.saveToken(token);
        return Right(token);
      },
    );
  }
}
