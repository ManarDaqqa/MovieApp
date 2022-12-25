import 'package:hive/hive.dart';

class MovieModel {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  String? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  num? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  num? voteAverage;
  int? voteCount;
  String? name;

  MovieModel(
      {this.adult,
        this.backdropPath,
        this.genreIds,
        this.id,
        this.originalLanguage,
        this.originalTitle,
        this.overview,
        this.popularity,
        this.posterPath,
        this.releaseDate,
        this.title,
        this.video,
        this.voteAverage,
        this.voteCount,
        this.name
      });

  MovieModel.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'].cast<int>();
    id = json['id'].toString();
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'] as String;
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['adult'] = adult;
    data['backdrop_path'] = backdropPath;
    data['genre_ids'] = genreIds;
    data['id'] = id;
    data['original_language'] = originalLanguage;
    data['original_title'] = originalTitle;
    data['overview'] = overview;
    data['popularity'] = popularity;
    data['poster_path'] = posterPath;
    data['release_date'] = releaseDate;
    data['title'] = title;
    data['video'] = video;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    data['name'] = name;
    return data;
  }
}


class MovieDetailModel {
  bool? adult;
  String? backdropPath;
  List<Genres>? genres;
  String? id;
  String? imdbId;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? releaseDate;
  int? runtime;
  String? status;
  String? tagline;
  num? voteAverage;
  int? voteCount;

  MovieDetailModel(
      {this.adult,
        this.backdropPath,
        this.genres,
        this.id,
        this.imdbId,
        this.originalLanguage,
        this.originalTitle,
        this.overview,
        this.posterPath,
        this.releaseDate,
        this.runtime,
        this.status,
        this.tagline,
        this.voteAverage,
        this.voteCount,
        required genreIds,
        required popularity,
        required title,
        required video});

  MovieDetailModel.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    if (json['genres'] != null) {
      genres = <Genres>[];
      json['genres'].forEach((v) {
        genres!.add(Genres.fromJson(v));
      });
    }
    id = json['id'].toString();
    imdbId = json['imdb_id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    runtime = json['runtime'];
    status = json['status'];
    tagline = json['tagline'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['adult'] = adult;
    data['backdrop_path'] = backdropPath;
    if (genres != null) {
      data['genres'] = genres!.map((v) => v.toJson()).toList();
    }
    data['id'] = id;
    data['imdb_id'] = imdbId;
    data['original_language'] = originalLanguage;
    data['original_title'] = originalTitle;
    data['overview'] = overview;
    data['poster_path'] = posterPath;
    data['release_date'] = releaseDate;
    data['runtime'] = runtime;
    data['status'] = status;
    data['tagline'] = tagline;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    return data;
  }
}

class Genres {
  int? id;
  String? name;

  Genres({this.id, this.name});

  Genres.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}


class CastModel {
  int? gender;
  int? id;
  String? name;
  String? originalName;
  double? popularity;
  String? profilePath;
  int? castId;
  String? character;
  int? order;

  CastModel({
    this.gender,
    this.id,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.castId,
    this.character,
    this.order,
  });

  CastModel.fromJson(Map<String, dynamic> json) {
    gender = json['gender'];
    id = json['id'];
    name = json['name'];
    originalName = json['original_name'];
    popularity = json['popularity'];
    profilePath = json['profile_path'];
    castId = json['cast_id'];
    character = json['character'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['gender'] = gender;
    data['id'] = id;
    data['name'] = name;
    data['original_name'] = originalName;
    data['popularity'] = popularity;
    data['profile_path'] = profilePath;
    data['cast_id'] = castId;
    data['character'] = character;
    data['order'] = order;
    return data;
  }
}


@HiveType(typeId: 0)
class LikedModel extends HiveObject {
  @HiveField(0)
  bool isLiked = false;
  @HiveField(1)
  String title;
  @HiveField(2)
  List<int> genres;
  @HiveField(3)
  double voteAverage;
  @HiveField(4)
  String posterPath;

  LikedModel(
      {this.isLiked = false,
        required this.title,
        required this.genres,
        required this.voteAverage,
        required this.posterPath});
}