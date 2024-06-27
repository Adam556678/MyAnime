import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_anime/core/errors/exceptions.dart';
import 'package:my_anime/features/anime/data/models/anime_model.dart';
import 'package:my_anime/features/anime/data/models/recommendations_model.dart';
import 'package:http/http.dart' as http;
import 'package:my_anime/features/anime/data/models/top_anime_model.dart';

abstract class AnimeRemoteDataSource {
  Future<Recommendations> getRecommendations(int pageNum);
  Future<TopAnime> getTopAnime(int pageNum);
  Future<Unit> addFavourite(int id);
  Future<Unit> removeFavourite(int id);
  Future<List<AnimeModel>> getFavourites();
  Future<AnimeModel> getAnimeById(int id);
  Future<bool> checkIfFavourite(int id);
  Future<AnimeModel> getRandomAnime();
}

class AnimeRemoteDataSourceImpl extends AnimeRemoteDataSource {
  final http.Client client;
  final FirebaseFirestore firestore;
  final FirebaseAuth firebaseAuth;
  AnimeRemoteDataSourceImpl(
      {required this.firebaseAuth,
      required this.firestore,
      required this.client});

  @override
  Future<Recommendations> getRecommendations(int pageNum) async {
    final baseUrl =
        "https://api.jikan.moe/v4/recommendations/anime?page=$pageNum";

    final response = await client.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body) as Map<String, dynamic>;
      final recommendations = Recommendations.fromJson(responseBody);

      return recommendations;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<TopAnime> getTopAnime(int pageNum) async {
    final baseUrl = "https://api.jikan.moe/v4/top/anime?page=$pageNum";

    final response = await client.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      //Success
      final responseBody = json.decode(response.body) as Map<String, dynamic>;
      final topAnime = TopAnime.fromJson(responseBody);
      return topAnime;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<AnimeModel>> getFavourites() async {
    try {
      //get the current user
      final user = firebaseAuth.currentUser;
      //Reference to the favourites collection
      CollectionReference collection = getFavouritesCollection(user!);
      QuerySnapshot snapshot = await collection.get();

      //get all docs and store them in a list of anime model
      List<AnimeModel> favorites = snapshot.docs
          .map((doc) {
            if (doc.data() != null) {
              return AnimeModel.fromJson(doc.data() as Map<String, dynamic>);
            }
          })
          .where((anime) => anime != null)
          .cast<AnimeModel>()
          .toList();

      //return favorites
      return favorites;
    } on Exception {
      throw ServerException();
    }
  }

  @override
  Future<Unit> addFavourite(int id) async {
    try {
      //get the current user
      final user = firebaseAuth.currentUser;

      //Reference to the favourites collection
      CollectionReference collection = getFavouritesCollection(user!);

      //favourite document
      DocumentReference favouriteAnimeDoc = collection.doc('$id');

      //get anime model
      AnimeModel animeModel = await getAnimeById(id);

      //add data to the collection
      await favouriteAnimeDoc.set(animeModel.toJson());
      return unit;
    } catch (e) {
      throw ServerException();
    }
  }

  CollectionReference getFavouritesCollection(User user) =>
      firestore.collection('users').doc(user.email).collection('favourites');

  @override
  Future<AnimeModel> getAnimeById(int id) async {
    //declare the url
    final url = 'https://api.jikan.moe/v4/anime/$id';

    //get response
    final response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      //get the response body if status ok
      final responseBody = json.decode(response.body) as Map<String, dynamic>;
      final responseData = responseBody['data'] as Map<String, dynamic>;
      //map the response to anime model then return it
      return AnimeModel.fromJson(responseData);
    } else {
      //throw server Exception if status is not okay
      throw ServerException();
    }
  }

  @override
  Future<Unit> removeFavourite(int id) async {
    try {
      //get current user
      final user = firebaseAuth.currentUser;
      //refrence favourite collection
      CollectionReference collection = getFavouritesCollection(user!);

      //Reference to the document
      DocumentReference docRef = collection.doc('$id');

      //get snapshot of the document with the same id
      DocumentSnapshot snapshot = await docRef.get();

      if (snapshot.exists) {
        //if document exists then delete it
        await docRef.delete();
      } else {
        throw ElementNotFoundException();
      }

      return Future.value(unit);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<bool> checkIfFavourite(int id) async {
    //get current user
    final user = firebaseAuth.currentUser;
    //reference favourite collection
    try {
      CollectionReference collection = getFavouritesCollection(user!);

      DocumentSnapshot snapshot = await collection.doc('$id').get();

      //if snapshot exists then it's in favourites
      //return true if it exists
      return snapshot.exists;
    } on Exception {
      throw ServerException();
    }
  }

  @override
  Future<AnimeModel> getRandomAnime() async {
    String baseUrl = 'https://api.jikan.moe/v4/random/anime';

    final response = await client.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      //get the response body if status ok
      final responseBody = json.decode(response.body) as Map<String, dynamic>;
      final responseData = responseBody['data'] as Map<String, dynamic>;
      //map the response to anime model then return it
      return AnimeModel.fromJson(responseData);
    } else {
      //throw server Exception if status is not okay
      throw ServerException();
    }
  }
}
