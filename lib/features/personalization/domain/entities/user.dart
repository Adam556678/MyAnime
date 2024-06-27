import 'package:my_anime/features/personalization/domain/entities/user_phone_number.dart';

class UserEntity {
  final String firstName;
  final String email;
  final UserPhoneNumber? phoneNumber;
  final String bio;
  final String lastName;
  final String userPhoto;
  UserEntity({
    required this.firstName,
    required this.email,
    this.phoneNumber,
    required this.bio,
    required this.lastName,
    required this.userPhoto,
  });
}
