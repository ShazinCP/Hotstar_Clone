import 'package:flutter/material.dart';
import 'package:hotstar/helper/color.dart';


class PlayButton extends StatelessWidget {
  const PlayButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: 180,
      child: TextButton.icon(
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
          style: TextStyle(fontSize: 12, color: cWhiteColor),
        ),
      ),
    );
  }
}
