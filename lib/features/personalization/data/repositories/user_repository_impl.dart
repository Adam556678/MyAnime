import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:my_anime/core/errors/exceptions.dart';

import 'package:my_anime/core/errors/failures.dart';
import 'package:my_anime/core/strings/failure_messages.dart';
import 'package:my_anime/features/personalization/data/datasources/remote_data_source.dart';
import 'package:my_anime/features/personalization/data/models/user_model.dart';
import 'package:my_anime/features/personalization/domain/entities/user.dart';
import 'package:my_anime/features/personalization/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final RemoteDataSource remoteDataSource;

  UserRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, Unit>> addUser(UserEntity user) async {
    final userModel = UserModel(
        firstName: user.firstName,
        email: user.email,
        phoneNumber: user.phoneNumber,
        bio: user.bio,
        lastName: user.lastName,
        userPhoto: user.userPhoto);

    try {
      await remoteDataSource.addUser(userModel);
      return const Right(unit);
    } on ServerException {
      return Left(ServerFailure(FailureMessages.offlineFailureMessage));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteUser(String userEmail) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> editUser(UserEntity user, File? file) async {
    //convert user entity to a model
    UserModel userModel = UserModel(
        firstName: user.firstName,
        email: user.email,
        phoneNumber: user.phoneNumber,
        bio: user.bio,
        lastName: user.lastName,
        userPhoto: user.userPhoto);

    try {
      await remoteDataSource.editUser(userModel, file);
      return const Right(unit);
    } on ServerException {
      return Left(ServerFailure(FailureMessages.errorUpdating));
    }
  }

  @override
  Future<Either<Failure, UserModel>> getUserDetails(String userEmail) async {
    try {
      final user = await remoteDataSource.getUserDetails(userEmail);
      return Right(user);
    } on ServerException {
      return Left(ServerFailure(FailureMessages.offlineFailureMessage));
    }
  }
}
