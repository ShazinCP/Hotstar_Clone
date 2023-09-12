import 'package:flutter/material.dart';
import 'package:hotstar/constants/constants.dart';


class CustomeAppBar extends StatelessWidget {
  final Widget leftwidget;
  //final String title;
  const CustomeAppBar({super.key,required this.leftwidget});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          leftwidget,
          const Spacer(),
          SizedBox(
            height: 70,
            width: 70,
            child: Image.asset("assets/subscribe_image.jpg"),
          ),
          cWidth,
           const Icon(Icons.cast, size: 25),
          // cWidth,
        ],
      ),
    );
  }
}
