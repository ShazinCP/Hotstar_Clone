import 'package:flutter/material.dart';
import 'package:hotstar/model/movie_model.dart';
import 'package:hotstar/services/search_idl_services.dart';

class SearchIDLProvider extends ChangeNotifier {
  List<MovieModel> trendingMovies = [];
  bool isLoading = true;

  Future fetchSearchIDLMovies() async {
    trendingMovies = await SearchIDLServices().fetchSearchMovies();
    isLoading = false;
    notifyListeners();
  }
}
