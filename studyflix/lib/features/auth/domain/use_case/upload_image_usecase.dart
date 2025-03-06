import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:studyflix/app/usecase/usecase.dart';
import 'package:studyflix/core/error/failure.dart';
import 'package:studyflix/features/auth/domain/repository/auth_repository.dart';

class UploadImageParams {
  final File file;

  const UploadImageParams({
    required this.file,
  });
}

class UploadImageUsecase
    implements UsecaseWithParams<String, UploadImageParams> {
  final IAuthRepository _repository;

  UploadImageUsecase(this._repository);

  @override
  Future<Either<Failure, String>> call(UploadImageParams params) {
    return _repository.uploadProfilePicture(params.file);
  }
}
