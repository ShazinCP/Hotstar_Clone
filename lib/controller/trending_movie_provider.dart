import 'package:flutter/material.dart';
import 'package:hotstar/services/download_services.dart';

class TrendingMovieProvider extends ChangeNotifier{
  List imageList=[];
  bool isLoading=true;

   void initializeImages() async {
    imageList=await DownloadsServices().getTrendingMovies();
         isLoading=false;
         notifyListeners();
    }
  }
