import 'package:dartz/dartz.dart';
import 'package:my_anime/core/errors/failures.dart';
import 'package:my_anime/features/personalization/data/models/user_model.dart';
import 'package:my_anime/features/personalization/domain/repositories/user_repository.dart';

class GetUserDetailsUseCase {
  final UserRepository userRepository;

  GetUserDetailsUseCase({required this.userRepository});

  Future<Either<Failure, UserModel>> call(String userEmail) async {
    return await userRepository.getUserDetails(userEmail);
  }
}
