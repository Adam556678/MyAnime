class Recommendations {
  final int lastPage;
  final List<RecommendedAnime> data;

  Recommendations({required this.lastPage, required this.data});

  factory Recommendations.fromJson(Map<String, dynamic> json) =>
      Recommendations(
        lastPage: json['pagination']['last_visible_page'],
        data: List<RecommendedAnime>.from(
          json['data'].map((x) => RecommendedAnime.fromJson(x)),
        ),
      );
}

class RecommendedAnime {
  final int id;
  final String title;
  final Images images;

  RecommendedAnime(
      {required this.id, required this.title, required this.images});

  factory RecommendedAnime.fromJson(Map<String, dynamic> json) =>
      RecommendedAnime(
        id: json['entry'][0]['mal_id'],
        title: json['entry'][0]['title'],
        images: Images.fromJson(json['entry'][0]['images']['jpg']),
      );
}

class Images {
  final String imageUrl;
  final String smallImageUrl;
  final String largeImageUrl;

  Images(
      {required this.imageUrl,
      required this.smallImageUrl,
      required this.largeImageUrl});

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        imageUrl: json['image_url'] ?? '',
        smallImageUrl: json['small_image_url'] ?? '',
        largeImageUrl: json['large_image_url'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'jpg': {
          'image_url': imageUrl,
          'small_image_url': smallImageUrl,
          'large_image_url': largeImageUrl
        }
      };
}
