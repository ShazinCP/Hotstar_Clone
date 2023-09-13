import 'package:hotstar/model/movie_model.dart';

class TMDBApiResponseModel{
  List<MovieModel>results=[];

  TMDBApiResponseModel.fromjson(Map data){
       results = (data['results'] as List)
        .map((item) => MovieModel.fromjson(item))
        // ignore: unnecessary_null_comparison
        .where((movieInfo) => movieInfo != null) // Filter out null values
        .toList();
  }

  Map<String,dynamic>tojson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['results']=results.map((MovieModel movieInfo)=>movieInfo.tojson()).toList();
    return data;
  }
}