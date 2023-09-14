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
     Size size = MediaQuery.of(context).size;
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
        cHeight,
        VideoWidget(videoImage: imageUrl),
        cHeight5,
         Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
             Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: size.width - 25,
                      child: TextButton.icon(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(cGreyColor900),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                        ),
                        icon: const Icon(
                          Icons.play_arrow_rounded,
                          color: cWhiteColor,
                        ),
                        label: const Text(
                          "Watch Now",
                          style:
                               TextStyle(fontSize: 14, color: cWhiteColor),
                        ),
                      ),
                    ),
                  ),
                  cHeight20
          ],
        )
      ],
    );
  }
}
