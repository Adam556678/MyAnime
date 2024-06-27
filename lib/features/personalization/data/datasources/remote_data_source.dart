import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:my_anime/core/errors/exceptions.dart';
import 'package:my_anime/features/personalization/data/models/user_model.dart';
import 'package:my_anime/utils/helpers/users_hepler.dart';
import 'package:path/path.dart' as p;

abstract class RemoteDataSource {
  Future<Unit> addUser(UserModel user);
  Future<Unit> deleteUser(String userEmail);
  Future<Unit> editUser(UserModel user, File? file);
  Future<String> uploadImage(String childName, File file);
  Future<UserModel> getUserDetails(String userEmail);
}

class RemoteDataSourceImpl extends RemoteDataSource {
  //reference to users collection
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('users');

  //fire auth instance
  final fireAuthuser = FirebaseAuth.instance.currentUser;

  //firebase storage instance
  final _storage = FirebaseStorage.instance;

  @override
  Future<Unit> addUser(UserModel user) async {
    try {
      await collectionReference.doc(user.email).set(user.toJson());
      return Future.value(unit);
    } on Exception {
      throw ServerException();
    }
  }

  @override
  Future<Unit> deleteUser(String userEmail) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<Unit> editUser(UserModel user, File? file) async {
    DocumentReference documentReference =
        collectionReference.doc(UsersHelper.getUserEmail());

    //user image
    String imgUrl = '';
    if (file != null) {
      imgUrl = await uploadImage(user.email, file);
    }

    //Convert phone Number to json
    Map<String, dynamic> jsonPhoneNum = {};
    if (user.phoneNumber != null) {
      jsonPhoneNum = user.phoneNumber!.toJson();
    }

    Map<String, dynamic> data = {
      "bio": user.bio,
      "email": user.email,
      "firstName": user.firstName,
      "lastName": user.lastName,
      "phoneNumber": jsonPhoneNum,
      "userPhoto": imgUrl
    };

    try {
      //update document data
      await documentReference.update(data);

      return Future.value(unit);
    } on Exception {
      throw ServerException();
    }
  }

  @override
  Future<UserModel> getUserDetails(String userEmail) async {
    DocumentSnapshot documentSnapshot =
        await collectionReference.doc(userEmail).get();
    if (documentSnapshot.exists) {
      final data = documentSnapshot.data() as Map<String, dynamic>;
      final user = UserModel.fromJson(data);

      return user;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<String> uploadImage(String childName, File file) async {
    //firestore file reference
    Reference ref = _storage.ref().child('$childName${p.basename(file.path)}');

    //store file
    UploadTask uploadTask = ref.putFile(file);
    TaskSnapshot snapshot = await uploadTask;

    //get download Url
    String url = await snapshot.ref.getDownloadURL();
    return url;
  }
}
