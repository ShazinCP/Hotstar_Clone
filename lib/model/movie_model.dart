class MovieModel {
  String? posterPath;
  String? title;
  String? releaseDate;
  String? originalTitle;
  String overview = "";
  bool? video;

  MovieModel({
    required this.posterPath,
    required this.title,
    required this.releaseDate,
    required this.originalTitle,
    required this.overview,
    required this.video,
  });
}
