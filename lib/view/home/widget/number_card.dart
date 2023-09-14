import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:hotstar/constants/constants.dart';
import 'package:hotstar/helper/color.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({super.key, required this.index, required this.imageUrl});
  final int index;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
             const SizedBox(
              width: 30,
              height: 200,
            ),
            Container(
              width: 130,
              height: 180,
              decoration: BoxDecoration(
                  borderRadius: cRadius10,
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(imageUrl))),
            ),
          ],
        ),
        Positioned(
          left: 18,
          bottom: -25,
          child: BorderedText(
            strokeColor:cWhiteColor,
            strokeWidth: 6.0,
            child: Text(
              "${index + 1}",
              style: const TextStyle(
                fontSize: 80,
                color: cBlackColor,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
