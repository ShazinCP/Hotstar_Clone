import 'package:flutter/material.dart';
import 'package:hotstar/helper/color.dart';
import 'package:hotstar/model/movie_model.dart';
import 'package:intl/intl.dart';


class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget(
      {super.key,
      required this.icon,
      required this.title,
      this.iconSize = 30,
      this.textSize = 18});
  final IconData icon;
  final String title;
  final double iconSize;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: cWhiteColor,
          size: iconSize,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: textSize,
          ),
        )
      ],
    );
  }
}

class PlayButton extends StatelessWidget {
  const PlayButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(cGreyColor900),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(5.0),
          ),
        ),
      ),
      icon: const Icon(
        Icons.play_arrow_rounded,
        color: cWhiteColor,
      ),
      label: const Text(
        "Watch Now",
        style: TextStyle(fontSize: 11, color: cWhiteColor),
      ),
    );
  }
}

// class RemindMeButton extends StatelessWidget {
//   const RemindMeButton({
//     super.key
//   });
// final MovieModel movieInfo;
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         TextButton.icon(
//           onPressed: () {},
//           style: ButtonStyle(
//             backgroundColor: MaterialStateProperty.all(cGreyColor900),
//             shape: MaterialStateProperty.all(
//               RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(5.0),
//               ),
//             ),
//           ),
//           icon: const Icon(
//             Icons.play_arrow_rounded,
//             color: cWhiteColor,
//           ),
//           label: const Text(
//             "Remind Me",
//             style: TextStyle(fontSize: 10, color: cWhiteColor),
//           ),
//         ),
//         Text(fetchDate(movieInfo.releaseDate!),
//                   style: const TextStyle(fontSize: 16, color: cGreyColor)),
//       ],
//     );
//   }
// }
