import 'package:flutter/material.dart';
import 'package:hotstar/model/movie_model.dart';
import 'package:hotstar/services/search_result_services.dart';

class SearchResultProvider extends ChangeNotifier {
  List<MovieModel> searchResultMovies = [];

  Future fetchSearchResult(String apiQuery) async {
    searchResultMovies = await SearchResultServices().fetchSearchResultMovies(apiQuery);
    notifyListeners();
  }
}
