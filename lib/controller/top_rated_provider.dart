import 'package:flutter/cupertino.dart';
import 'package:hotstar/model/movie_model.dart';
import 'package:hotstar/services/top_rated_services.dart';

class TopRateProvider extends ChangeNotifier {
  List<MovieModel> tvTopRate = [];
  bool isLoading = true;

  Future fetchTvTopRateMovies() async {
    tvTopRate=await TopRateServices().fetchTVTopRateMovies();
    isLoading = false;
    notifyListeners();
  }
}
