import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:my_anime/core/errors/failures.dart';
import 'package:my_anime/features/personalization/data/models/user_model.dart';
import 'package:my_anime/features/personalization/domain/entities/user.dart';

abstract class UserRepository {
  Future<Either<Failure, Unit>> addUser(UserEntity user);
  Future<Either<Failure, Unit>> editUser(UserEntity user, File? file);
  Future<Either<Failure, Unit>> deleteUser(String userEmail);
  Future<Either<Failure, UserModel>> getUserDetails(String userEmail);
}
