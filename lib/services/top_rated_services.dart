import 'package:hotstar/model/movie_model.dart';
import 'package:hotstar/constants/apiendpoint.dart';
import 'package:hotstar/services/base_client.dart';

class TopRateServices {
  List<MovieModel> tvtoprate = [];

  Future fetchTVTopRateMovies() async {
    try {
      final movies = await apiCall(ApiEndPoints.tvtoprate);
      tvtoprate = movies.results;
    } catch (error) {
      // Handle the error here
      print('Error fetching trending movies: $error');
    }
    return tvtoprate;
  }
}
