import 'package:flutter/material.dart';
import 'package:hotstar/controller/internet_connectivity_controller/internet_connectivity_provider.dart';
import 'package:hotstar/controller/new_and_hot_controller/new_hot_provider.dart';
import 'package:hotstar/view/new&hot/widgets/top_free_movies_infocard.dart';
import 'package:provider/provider.dart';

class TopFreeMoviesWidget extends StatefulWidget {
  const TopFreeMoviesWidget({
    super.key,
  });

  @override
  State<TopFreeMoviesWidget> createState() => _TopFreeMoviesWidgetState();
}

class _TopFreeMoviesWidgetState extends State<TopFreeMoviesWidget> {
  @override
  void initState() {
    super.initState();
    Provider.of<NewAndHotProvider>(context, listen: false).fetchTopFreeMovies();
    Provider.of<InternetConnectivityProvider>(context, listen: false)
        .getInternetConnectivity(context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NewAndHotProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (provider.moviepopular.isEmpty) {
          return const Center(child: Text("No data available"));
        }
        return ListView.builder(
          shrinkWrap: true,
          itemCount: provider.moviepopular.length,
          itemBuilder: (context, index) => TopFreeMoviesInfoCard(
            movieInfo: provider.moviepopular[index],
          ),
        );
      },
    );
  }
}
