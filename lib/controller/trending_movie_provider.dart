import 'package:flutter/material.dart';
// import 'package:netflix/services/download_services.dart';

class TrendingMovieProvider extends ChangeNotifier{
  List imageList=[
    "assets/download.jpeg",
    "assets/download.jpeg",
    "assets/download.jpeg"
  ];
  bool isLoading=true;

   void initializeImages() async {
//  imageList=await DownloadsServices().getTrendingMovies();
         isLoading=false;
         notifyListeners();
    }
  }
