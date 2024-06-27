import 'package:my_anime/features/anime/data/models/recommendations_model.dart';

class Anime {
  int id;
  String url;
  Images images;
  bool approved;
  List<Titles> titles;
  String title;
  int episodes;
  String status;
  Aired aired;
  String duration;
  String rating;
  double score;
  int rank;
  int favorites;
  String synopsis;
  int? year;
  Broadcast broadcast;
  List<Genre> genres;
  Anime({
    required this.id,
    required this.url,
    required this.images,
    required this.approved,
    required this.titles,
    required this.title,
    required this.episodes,
    required this.status,
    required this.aired,
    required this.duration,
    required this.rating,
    required this.score,
    required this.rank,
    required this.favorites,
    required this.synopsis,
    required this.year,
    required this.broadcast,
    required this.genres,
  });
}

class Genre {
  int id;
  String type;
  String name;
  String url;
  Genre({
    required this.id,
    required this.type,
    required this.name,
    required this.url,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json['mal_id'] ?? 0,
        type: json['type'] ?? '',
        name: json['name'] ?? '',
        url: json['url'] ?? '',
      );

  Map<String, dynamic> toJson() =>
      {'mal_id': id, 'type': type, 'name': name, 'url': url};
}

class Broadcast {
  String? day;
  String? time;
  String? timeZone;
  String? string;
  Broadcast({
    this.day,
    this.time,
    this.timeZone,
    this.string,
  });

  factory Broadcast.fromJson(Map<String, dynamic> json) => Broadcast(
        day: json['day'],
        time: json['time'],
        timeZone: json['timezone'],
        string: json['string'],
      );

  Map<String, dynamic> toJson() =>
      {'day': day, 'time': time, 'timezone': timeZone, 'string': string};
}

class Aired {
  String from;
  String to;
  String string;
  Aired({
    required this.from,
    required this.to,
    required this.string,
  });

  factory Aired.fromJson(Map<String, dynamic> json) => Aired(
        from: json['from'] ?? '',
        to: json['to'] ?? '',
        string: json['string'] ?? '',
      );

  Map<String, dynamic> toJson() => {'from': from, 'to': to, 'string': string};
}

class Titles {
  String type;
  String title;
  Titles({
    required this.type,
    required this.title,
  });

  factory Titles.fromJson(Map<String, dynamic> json) => Titles(
        type: json['type'] ?? '',
        title: json['title'] ?? '',
      );

  Map<String, dynamic> toJson() => {'type': type, 'title': title};
}
