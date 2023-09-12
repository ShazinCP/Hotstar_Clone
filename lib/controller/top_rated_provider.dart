import 'package:flutter/cupertino.dart';
import 'package:hotstar/model/movie_model.dart';

class TopRateProvider extends ChangeNotifier {
  List<MovieModel> tvTopRate = [];
  bool isLoading = true;

  Future fetchTvTopRateMovies() async {
// tvTopRate=await TVTopRateServices().fetchTVTopRateMovies();
    isLoading = false;
    notifyListeners();
  }
}
