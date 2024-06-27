import 'package:my_anime/features/personalization/domain/entities/user.dart';
import 'package:my_anime/features/personalization/domain/entities/user_phone_number.dart';

class UserModel extends UserEntity {
  UserModel(
      {required super.firstName,
      required super.email,
      required super.phoneNumber,
      required super.bio,
      required super.lastName,
      required super.userPhoto});

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'email': email,
        'phoneNumber': phoneNumber != null ? phoneNumber!.toJson() : {},
        'bio': bio,
        'lastName': lastName,
        'userPhoto': userPhoto,
      };

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      firstName: json['firstName'],
      email: json['email'],
      phoneNumber: UserPhoneNumber.fromJson(json['phoneNumber']),
      bio: json['bio'],
      lastName: json['lastName'],
      userPhoto: json['userPhoto']);
}
