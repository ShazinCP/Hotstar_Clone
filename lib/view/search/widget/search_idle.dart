
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotstar/constants/constants.dart';
import 'package:hotstar/controller/search_idl_provider.dart';
import 'package:hotstar/helper/color.dart';
import 'package:hotstar/model/movie_model.dart';
import 'package:hotstar/view/search/widget/title_search.dart';
import 'package:provider/provider.dart';

class SearchIdleWidget extends StatefulWidget {
  const SearchIdleWidget({super.key});

  @override
  State<SearchIdleWidget> createState() => _SearchIdleWidgetState();
}

class _SearchIdleWidgetState extends State<SearchIdleWidget> {
  @override
  void initState() {
    super.initState();
    // Provider.of<SearchIDLProvider>(context, listen: false).fetchSearchIDLMovies();
    // Provider.of<InternetConnectivityProvider>(context,listen: false).getInternetConnectivity(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(
          title: "POPULAR SEARCHES",
        ),
        cHeight,
        Expanded(
          child: Consumer<SearchIDLProvider>(
            builder: (context, value, child) {
              if(value.isLoading){
                return const Center(child: CircularProgressIndicator(),);
              }else if(value.trendingMovies.isEmpty){
                return const Text("NO data available");
              }
              return ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) =>
                    PopularSearchItemTile(movieInfo: value.trendingMovies[index]),
                separatorBuilder: (context, index) => cHeight20,
                itemCount: value.trendingMovies.length,
              );
            },
          ),
        )
      ],
    );
  }
}

class PopularSearchItemTile extends StatelessWidget {
  final MovieModel movieInfo;
  const PopularSearchItemTile({super.key, required this.movieInfo});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    String url =
        'https://image.tmdb.org/t/p/w500${movieInfo.posterPath}?api_key=b2dee3b855c4ea705ff5dda3c0201768';

    return Row(
      children: [
        Container(
          width: screenWidth * 0.35,
          height: 65,
          decoration: BoxDecoration(
              image:
                  DecorationImage(fit: BoxFit.cover, image: NetworkImage(url))),
        ),
        cWidth,
        Expanded(
          child: Text(
            movieInfo.title ?? "No Movie Name Found",
            style: const TextStyle(
                color: cWhiteColor, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        const CircleAvatar(
          backgroundColor: cWhiteColor,
          radius: 25,
          child: CircleAvatar(
            backgroundColor: cBlackColor,
            radius: 23,
            child: Icon(
              CupertinoIcons.play_fill,
              color: cWhiteColor,
            ),
          ),
        )
      ],
    );
  }
}