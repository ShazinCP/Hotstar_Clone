import 'package:hotstar/model/movie_model.dart';
import 'package:hotstar/constants/apiendpoint.dart';
import 'package:hotstar/services/base_client.dart';

class HomeBackgroundCardServices {
  String? imageUrl;

  setImage() async {
    dynamic result = await apiCall(ApiEndPoints.moviepopular);

    if (result.results.isNotEmpty) {
      MovieModel movieInfo = result.results[3];
      imageUrl =
          "https://image.tmdb.org/t/p/w500${movieInfo.posterPath}?api_key=b2dee3b855c4ea705ff5dda3c0201768";

      return imageUrl;
    }
  }
}
