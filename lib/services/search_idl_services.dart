import 'package:hotstar/model/movie_model.dart';
import 'package:hotstar/constants/apiendpoint.dart';
import 'package:hotstar/services/base_client.dart';

class SearchIDLServices {
  List<MovieModel> trendingMovies = [];

  Future fetchSearchMovies() async {
    try {
      final movies = await apiCall(ApiEndPoints.trendingMovies);
      trendingMovies = movies.results;
    } catch (error) {
      // Handle the error here
      print('Error fetching trending movies: $error');
    }
    return trendingMovies;
  }
}
