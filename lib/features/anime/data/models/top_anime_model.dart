import 'package:my_anime/features/anime/data/models/anime_model.dart';

class TopAnime {
  final Pagination pagination;
  final List<AnimeModel> data;

  TopAnime({required this.pagination, required this.data});

  factory TopAnime.fromJson(Map<String, dynamic> json) => TopAnime(
        pagination: Pagination.fromJson(json['pagination']),
        data: List<AnimeModel>.from(
          json['data'].map((x) => AnimeModel.fromJson(x)),
        ),
      );
}

class Pagination {
  final int lastVisiblePage;
  final bool hasNextPage;
  final int currentPage;
  final PaginationItems items;

  Pagination(
      {required this.hasNextPage,
      required this.currentPage,
      required this.lastVisiblePage,
      required this.items});

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
      hasNextPage: json['has_next_page'],
      currentPage: json['current_page'],
      lastVisiblePage: json['last_visible_page'],
      items: PaginationItems.fromJson(json['items']));
}

class PaginationItems {
  final int count;
  final int total;
  final int perPage;

  PaginationItems(
      {required this.count, required this.total, required this.perPage});

  factory PaginationItems.fromJson(Map<String, dynamic> json) =>
      PaginationItems(
          count: json['count'],
          total: json['total'],
          perPage: json['per_page']);
}
