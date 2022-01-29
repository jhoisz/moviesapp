import 'package:moviesapp/src/api/api.dart';
import 'package:moviesapp/src/home/models/movie.dart';

class HomeService {
  Future<List<Movie>> fetchMovies() async {
    final response = await dio.get('movie/popular');
    return (response.data['results'] as List).map((element) {
      return Movie.fromJson(element);
    }).toList();
  }

  Future<List<Movie>> searchMovie(String query) async {
    final response = await dio.get(
      'search/movie',
      queryParameters: {'query': query},
    );
    return (response.data['results'] as List).map((element) {
      return Movie.fromJson(element);
    }).toList();
  }
}
