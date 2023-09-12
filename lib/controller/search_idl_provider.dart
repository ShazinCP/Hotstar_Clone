import 'package:flutter/material.dart';
import 'package:hotstar/model/movie_model.dart';

class SearchIDLProvider extends ChangeNotifier {
  List<MovieModel> trendingMovies = [];
  bool isLoading = true;

  Future fetchSearchIDLMovies() async {
    // trendingMovies = await searchIDLServices().fetchSearchMovies();
    isLoading = false;
    notifyListeners();
  }
}
