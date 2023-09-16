import 'package:hotstar/model/movie_model.dart';
import 'package:hotstar/services/base_client.dart';

import '../constants/apiendpoint.dart';

class NewAndHotServices {
  List<MovieModel> upcomingMovies = [];
  List<MovieModel> moviepopular = [];

  Future fetchUpcomingMovies() async {
    try {
      final movies = await apiCall(ApiEndPoints.upcoming);
      upcomingMovies = movies.results;
    } catch (error) {
      // Handle the error here
      print('Error fetching trending movies: $error');
    }
    return upcomingMovies;
  }

  Future fetchMoviePopular() async {
    try {
      final movies = await apiCall(ApiEndPoints.moviepopular);
      moviepopular = movies.results;
    } catch (error) {
      // Handle the error here
      print('Error fetching trending movies: $error');
    }
    return moviepopular;
  }
}
