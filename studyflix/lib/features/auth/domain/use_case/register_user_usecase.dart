import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:studyflix/app/usecase/usecase.dart';
import 'package:studyflix/core/error/failure.dart';
import 'package:studyflix/features/auth/domain/entity/auth_entity.dart';
import 'package:studyflix/features/auth/domain/repository/auth_repository.dart';

class RegisterUserParams extends Equatable {
  final String username;
  final String email;
  final String password;
  final String? image;
  final String role;

  const RegisterUserParams({
    required this.username,
    required this.email,
    required this.password,
    this.image,
    required this.role,
  });

  //intial constructor
  const RegisterUserParams.initial({
    required this.username,
    required this.email,
    required this.password,
    this.image,
    required this.role,
  });

  @override
  List<Object?> get props => [username, email, password, role];
}

class RegisterUseCase implements UsecaseWithParams<void, RegisterUserParams> {
  final IAuthRepository repository;

  RegisterUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(RegisterUserParams params) {
    final authEntity = AuthEntity(
      username: params.username,
      email: params.email,
      password: params.password,
      image: params.image,
      role: params.role,
    );
    return repository.registerUser(authEntity);
  }
}
