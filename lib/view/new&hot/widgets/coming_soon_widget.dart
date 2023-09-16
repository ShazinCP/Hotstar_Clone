import 'package:flutter/material.dart';
import 'package:hotstar/controller/new_and_hot_controller/new_hot_provider.dart';
import 'package:hotstar/view/new&hot/widgets/coming_soon_info_card.dart';
import 'package:provider/provider.dart';

class ComingSoonWidget extends StatefulWidget {
  const ComingSoonWidget({
    super.key,
  });

  @override
  State<ComingSoonWidget> createState() => _ComingSoonWidgetState();
}

class _ComingSoonWidgetState extends State<ComingSoonWidget> {
  @override
  void initState() {
    super.initState();
    Provider.of<NewAndHotProvider>(context, listen: false)
        .fetchComingSoonMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NewAndHotProvider>(
      builder: (context, comingSoonProvider, child) {
        if (comingSoonProvider.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (comingSoonProvider.upcomingMovies.isEmpty) {
          return const Center(child: Text("No data available"));
        }
        return ListView.builder(
          itemCount: comingSoonProvider.upcomingMovies.length,
          itemBuilder: (context, index) => ComingSoonInfoCard(
            movieInfo: comingSoonProvider.upcomingMovies[index],
          ),
        );
      },
    );
  }
}