import 'package:flutter/material.dart';
import 'package:hotstar/model/movie_model.dart';
import 'package:hotstar/services/new&hot_services.dart';

class NewAndHotProvider extends ChangeNotifier {
  List<MovieModel> upcomingMovies = [];
  List<MovieModel> moviepopular = [];
  bool isLoading = true;

  Future fetchComingSoonMovies() async {
    upcomingMovies = await NewAndHotServices().fetchUpcomingMovies();
    isLoading = false;
    notifyListeners();
  }

  Future fetchTopFreeMovies() async {
    moviepopular = await NewAndHotServices().fetchMoviePopular();
    isLoading = false;
    notifyListeners();
  }
}
