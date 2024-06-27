import 'package:my_anime/features/anime/data/models/recommendations_model.dart';
import 'package:my_anime/features/anime/domain/entities/anime.dart';

class AnimeModel extends Anime {
  AnimeModel(
      {required super.id,
      required super.url,
      required super.images,
      required super.approved,
      required super.titles,
      required super.title,
      required super.episodes,
      required super.status,
      required super.aired,
      required super.duration,
      required super.rating,
      required super.score,
      required super.rank,
      required super.favorites,
      required super.synopsis,
      required super.year,
      required super.broadcast,
      required super.genres});

  factory AnimeModel.fromJson(Map<String, dynamic> json) {
    return AnimeModel(
      id: json['mal_id'] ?? 0,
      url: json['url'] ?? '',
      images: Images.fromJson(json['images']['jpg']),
      approved: json['approved'],
      titles: List<Titles>.from(json['titles'].map((x) => Titles.fromJson(x))),
      title: json['title'] ?? '',
      episodes: json['episodes'] ?? 0,
      status: json['status'] ?? '',
      aired: Aired.fromJson(json['aired']),
      duration: json['duration'] ?? '',
      rating: json['rating'] ?? '',
      score: json['score'] ?? 0.0,
      rank: json['rank'] ?? 0,
      favorites: json['favorites'],
      synopsis: json['synopsis'] ?? '',
      year: json['year'] ?? 0,
      broadcast: Broadcast.fromJson(json['broadcast']),
      genres: List<Genre>.from(json['genres'].map((x) => Genre.fromJson(x))),
    );
  }
  Map<String, dynamic> toJson() => {
        'mal_id': id,
        'url': url,
        'images': images.toJson(),
        'titles': titles.map((title) => title.toJson()).toList(),
        'approved': approved,
        'title': title,
        'episodes': episodes,
        'status': status,
        'aired': aired.toJson(),
        'duration': duration,
        'rating': rating,
        'score': score,
        'rank': rank,
        'favorites': favorites,
        'synopsis': synopsis,
        'year': year,
        'broadcast': broadcast.toJson(),
        'genres': genres.map((genre) => genre.toJson()).toList()
      };
}
