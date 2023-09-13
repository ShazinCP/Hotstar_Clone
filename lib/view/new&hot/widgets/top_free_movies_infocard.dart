import 'package:flutter/material.dart';
import 'package:hotstar/constants/constants.dart';
import 'package:hotstar/helper/color.dart';
import 'package:hotstar/model/movie_model.dart';
import 'package:hotstar/widgets/button_widget.dart';
import 'package:hotstar/widgets/video_widget.dart';

class TopFreeMoviesInfoCard extends StatelessWidget {
  const TopFreeMoviesInfoCard({super.key, required this.movieInfo});
  final MovieModel movieInfo;
  @override
  Widget build(BuildContext context) {
    String imageUrl =
        'https://image.tmdb.org/t/p/w500${movieInfo.posterPath}?api_key=b2dee3b855c4ea705ff5dda3c0201768';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        cHeight,
        Text(
          movieInfo.originalTitle ?? "No Title Found ",
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        cHeight,
        Text(
          movieInfo.overview,
          style: const TextStyle(color: cGreyColor),
        ),
        cHeight50,
        VideoWidget(videoImage: imageUrl),
        cHeight,
        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButtonWidget(
              icon: Icons.share,
              title: "Share",
              iconSize: 25,
              textSize: 16,
            ),
            cWidth,
            CustomButtonWidget(
              icon: Icons.add,
              title: "My List",
              iconSize: 25,
              textSize: 16,
            ),
            cWidth,
            CustomButtonWidget(
              icon: Icons.play_arrow,
              title: "Play",
              iconSize: 25,
              textSize: 15,
            ),
            cWidth
          ],
        )
      ],
    );
  }
}
