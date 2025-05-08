class MoviesModel {
  int total;
  int page;
  int pages;
  List<TvShow> tvShows;

  MoviesModel({
    required this.total,
    required this.page,
    required this.pages,
    required this.tvShows,
  });
}

class TvShow {
  int id;
  String name;
  String permalink;
  DateTime startDate;
  dynamic endDate;
  Country country;
  String network;
  Status status;
  String imageThumbnailPath;

  TvShow({
    required this.id,
    required this.name,
    required this.permalink,
    required this.startDate,
    required this.endDate,
    required this.country,
    required this.network,
    required this.status,
    required this.imageThumbnailPath,
  });
}

enum Country { CA, GB, JP, US }

enum Status { ENDED, RUNNING }
