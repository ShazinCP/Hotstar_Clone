import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hotstar/constants/constants.dart';
import 'package:hotstar/controller/homescroll_provider.dart';
import 'package:hotstar/view/home/widget/custom_appbar.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Provider.of<InternetConnectivityProvider>(context,listen: false).getInternetConnectivity(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<HomeScrollProvider>(
      builder: (context, scrollProvider, child) {
        return NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            final ScrollDirection direction = notification.direction;
            if (direction == ScrollDirection.reverse) {
              scrollProvider.setIsScrolling(false);
            } else if (direction == ScrollDirection.forward) {
              scrollProvider.setIsScrolling(true);
            }
            return true;
          },
          child: Stack(
            children: [
              scrollProvider.isScrolling == true
                  ? AnimatedContainer(
                            duration: const Duration(milliseconds: 1000),
                            width: double.infinity,
                            height: 90,
                            color: Colors.black.withOpacity(0.3),
                            child: Column(
                              children: [
                                CustomeAppBar(
                                  leftwidget: Image.asset(
                                    'assets/logo_image.png',
                                    width: 80,
                                    height: 70,
                                  ),
                                ),
                              ],
                            ),
                          )
                  : cHeight,
              // ListView(
              //   children: const [
              //     BackgroundCard(),
              //     cHeight,
              //     NumberTitleCard(),
              //     cHeight,
              //     MainTitleCard(
              //       title: "New Releases",
              //       apiUrl: ApiEndPoints.moviepopular,
              //     ),
              //     cHeight,
              //     MainTitleCard(
              //       title: "Trending Now",
              //       apiUrl: ApiEndPoints.trendingMovies,
              //     ),
              //     cHeight,
              //     MainTitleCard(
              //       title: "Popular Shows",
              //       apiUrl: ApiEndPoints.tvpopular,
              //     ),
              //     cHeight,
              //     MainTitleCard(
              //       title: "Upcoming",
              //       apiUrl: ApiEndPoints.upcoming,
              //     )
              //   ],
              // ),
            ],
          ),
        );
      },
    ));
  }
}



// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:hotstar/constants/constants.dart';
// import 'package:hotstar/view/home/widget/background_card.dart';
// import 'package:hotstar/view/home/widget/custom_appbar.dart';

// ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ValueListenableBuilder(
//           valueListenable: scrollNotifier,
//           builder: (context, index, _) {
//             return NotificationListener<UserScrollNotification>(
//               onNotification: ((notification) {
//                 final ScrollDirection direction = notification.direction;
//                 if (direction == ScrollDirection.reverse) {
//                   scrollNotifier.value = false;
//                 } else if (direction == ScrollDirection.forward) {
//                   scrollNotifier.value = true;
//                 }
//                 return true;
//               }),
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Stack(
//                   children: [
//                     ListView(
//                       children: const [
//                         BackgroundCard(),
//                         cHeight,
//                         // MainTitleMovieCard(
//                         //   title: "New Releases",
//                         //   // apiUrl: ApiEndPoints.moviepopular,
//                         // ),
//                         // cHeight,
//                         // MainTitleMovieCard(
//                         //   title: "Trending Now",
//                         //   // apiUrl: ApiEndPoints.trendingall,
//                         // ),
//                         // cHeight,
//                         // // NumberTitleMovieCard(),
//                         // cHeight,
//                         // MainTitleMovieCard(
//                         //   title: "Popular Shows",
//                         //   // apiUrl: ApiEndPoints.tvpopular,
//                         // ),
//                         // cHeight,
//                         // MainTitleMovieCard(
//                         //   title: "Upcoming",
//                         //   // apiUrl: ApiEndPoints.upcoming,
//                         // ),
//                         cHeight,
//                       ],
//                     ),
//                     scrollNotifier.value == true
//                         ? AnimatedContainer(
//                             duration: const Duration(milliseconds: 1000),
//                             width: double.infinity,
//                             height: 90,
//                             color: Colors.black.withOpacity(0.3),
//                             child: Column(
//                               children: [
//                                 CustomeAppBar(
//                                   leftwidget: Image.asset(
//                                     'assets/logo_image.png',
//                                     width: 80,
//                                     height: 70,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           )
//                         : cHeight,
//                   ],
//                 ),
//               ),
//             );
//           }),
//     );
//   }
// }