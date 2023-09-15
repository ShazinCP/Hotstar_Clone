import 'package:flutter/material.dart';
import 'package:hotstar/constants/constants.dart';
import 'package:hotstar/helper/color.dart';
import 'package:hotstar/model/movie_model.dart';
import 'package:hotstar/widgets/video_widget.dart';
import 'package:intl/intl.dart';

class ComingSoonInfoCard extends StatelessWidget {
  final MovieModel movieInfo;
  const ComingSoonInfoCard({super.key, required this.movieInfo});

  @override
  Widget build(BuildContext context) {
    String imageUrl =
        'https://image.tmdb.org/t/p/w500${movieInfo.posterPath}?api_key=b2dee3b855c4ea705ff5dda3c0201768';
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: size.width,
          height: 480,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(
                videoImage: imageUrl,
              ),
              cHeight,
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: size.width - 16,
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
                          Icons.notifications_none_sharp,
                          color: cWhiteColor,
                        ),
                        label: Text(
                          "Remind Me   ${fetchDate(movieInfo.releaseDate!)}",
                          style:
                              const TextStyle(fontSize: 14, color: cWhiteColor),
                          
                        ),
                      ),
                    ),
                  ),
                  // Text(fetchDate(movieInfo.releaseDate!),
                  //     style:
                  //         const TextStyle(fontSize: 16, color: cGreyColor)),
                ],
              ),
              // cHeight,
              // Text("Coming on ${fetchDay(movieInfo.releaseDate!)}"),
              // cHeight,
              Text(
                movieInfo.originalTitle ?? 'Empty Title',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              cHeight,
              Text(
                movieInfo.overview,
                style: const TextStyle(color: cGreyColor),
              ),
              cHeight
            ],
          ),
        ),
      ],
    );
  }

  String fetchDate(String date) {
    DateTime dateInFormat = DateTime.parse(date);
    final formatDate = (DateFormat.MMMMd().format(dateInFormat)).split(" ");

    return "${formatDate.first.substring(0, 3)} ${formatDate.last}";
  }

  String fetchDay(String date) {
    DateTime dateInFormat = DateTime.parse(date);
    final dayName = DateFormat('EEEE').format(dateInFormat);
    return dayName;
  }
}
