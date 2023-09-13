import 'package:flutter/material.dart';
import 'package:hotstar/helper/color.dart';
import 'package:hotstar/view/new&hot/widgets/coming_soon_widget.dart';
import 'package:hotstar/view/new&hot/widgets/top_free_movies_widget.dart';

class NewAndHotScreen extends StatelessWidget {
  const NewAndHotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: AppBar(
            bottom: const TabBar(
                unselectedLabelColor: cGreyColor,
                labelColor: cWhiteColor,
                isScrollable: true,
                indicatorColor: cWhiteColor,
                tabs: [
                  Tab(
                    text: "Coming Soon",
                  ),
                  Tab(
                    text: "Top Free Movies",
                  )
                ]),
          ),
        ),
        body: TabBarView(
          children: [_buildComingSoon(context), _buildTopFreeMovies()],
        ),
      ),
    );
  }
}

Widget _buildTopFreeMovies() {
  return const TopFreeMoviesWidget();
}

Widget _buildComingSoon(BuildContext context) {
  return const ComingSoonWidget();
}
