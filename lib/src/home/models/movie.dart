class Movie {
/*
{
  "adult": false,
  "backdrop_path": "/1Rr5SrvHxMXHu5RjKpaMba8VTzi.jpg",
  "genre_ids": [
    28
  ],
  "id": 634649,
  "original_language": "en",
  "original_title": "Spider-Man: No Way Home",
  "overview": "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.",
  "popularity": 7981.605,
  "poster_path": "/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg",
  "release_date": "2021-12-15",
  "title": "Spider-Man: No Way Home",
  "video": false,
  "vote_average": 8.4,
  "vote_count": 3722
} 
*/

  bool? adult;
  String? backdropPath;
  List<int?>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  Movie({
    this.adult,
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
  });
  Movie.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path']?.toString();
  if (json['genre_ids'] != null) {
  final v = json['genre_ids'];
  final arr0 = <int>[];
  v.forEach((v) {
  arr0.add(v.toInt());
  });
    genreIds = arr0;
    }
    id = json['id']?.toInt();
    originalLanguage = json['original_language']?.toString();
    originalTitle = json['original_title']?.toString();
    overview = json['overview']?.toString();
    popularity = json['popularity']?.toDouble();
    posterPath = json['poster_path']?.toString();
    releaseDate = json['release_date']?.toString();
    title = json['title']?.toString();
    video = json['video'];
    voteAverage = json['vote_average']?.toDouble();
    voteCount = json['vote_count']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['adult'] = adult;
    data['backdrop_path'] = backdropPath;
    if (genreIds != null) {
      final v = genreIds;
      final arr0 = [];
  v!.forEach((v) {
  arr0.add(v);
  });
      data['genre_ids'] = arr0;
    }
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
    return data;
  }

  String getImage(String? posterPath) {
    if (posterPath != null) {
      return 'https://image.tmdb.org/t/p/original/' + posterPath;
    }
    return 'https://www.iconpacks.net/icons/1/free-error-icon-905-thumb.png';
  }

}