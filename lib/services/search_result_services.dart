import 'package:hotstar/model/movie_model.dart';
import 'package:hotstar/services/apiendpoint.dart';
import 'package:hotstar/services/base_client.dart';

class SearchResultServices {
  List<MovieModel> searchResultMovies = [];

  Future fetchSearchResultMovies(String apiQuery) async {
    try {
      final movies = await apiCall(ApiEndPoints.searchmovie + apiQuery);
      searchResultMovies = movies.results;
    } catch (error) {
      print("Error fetching trendng movies:$error");
    }
    return searchResultMovies;
  }
}
