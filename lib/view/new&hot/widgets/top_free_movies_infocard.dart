import 'package:flutter/material.dart';
import 'package:hotstar/constants/constants.dart';
import 'package:hotstar/helper/color.dart';
import 'package:hotstar/model/movie_model.dart';
import 'package:hotstar/widgets/video_widget.dart';

class TopFreeMoviesInfoCard extends StatefulWidget {
  const TopFreeMoviesInfoCard({super.key, required this.movieInfo});
  final MovieModel movieInfo;

  @override
  State<TopFreeMoviesInfoCard> createState() => _TopFreeMoviesInfoCardState();
}

class _TopFreeMoviesInfoCardState extends State<TopFreeMoviesInfoCard> {
  
  
  @override
  Widget build(BuildContext context) {
    String imageUrl =
        'https://image.tmdb.org/t/p/w500${widget.movieInfo.posterPath}?api_key=b2dee3b855c4ea705ff5dda3c0201768';
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        cHeight,
        Text(
          widget.movieInfo.originalTitle ?? "No Title Found ",
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        cHeight,
        Text(
          widget.movieInfo.overview,
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
                width: size.width - 70,
                height: 45,
                child: TextButton.icon(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(cGreyColor900),
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
                    style: TextStyle(fontSize: 14, color: cWhiteColor),
                  ),
                ),
              ),
            ),
            Container(
              height: 45,
              width: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), color: cGreyColor900),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add,
                    color: cWhiteColor,
                  ),),
            ),
            cHeight25
          ],
        )
      ],
    );
  }
}
