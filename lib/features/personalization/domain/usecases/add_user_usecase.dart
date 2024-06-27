import 'package:dartz/dartz.dart';
import 'package:my_anime/core/errors/failures.dart';
import 'package:my_anime/features/personalization/domain/entities/user.dart';
import 'package:my_anime/features/personalization/domain/repositories/user_repository.dart';

class AddUserUsecase {
  final UserRepository userRepository;

  AddUserUsecase({required this.userRepository});
  Future<Either<Failure, Unit>> call(UserEntity user) async {
    return await userRepository.addUser(user);
  }
}
