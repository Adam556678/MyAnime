import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:my_anime/core/errors/failures.dart';
import 'package:my_anime/features/personalization/domain/entities/user.dart';
import 'package:my_anime/features/personalization/domain/repositories/user_repository.dart';

class UpdateUserUsecase {
  final UserRepository repository;
  UpdateUserUsecase({required this.repository});

  Future<Either<Failure, Unit>> call(UserEntity user, File? file) async {
    return await repository.editUser(user, file);
  }
}
