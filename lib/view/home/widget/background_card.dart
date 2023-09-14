import 'package:flutter/material.dart';
import 'package:hotstar/controller/home_backgroundcard_provider.dart';
import 'package:hotstar/widgets/button_widget.dart';
import 'package:provider/provider.dart';

class BackgroundCard extends StatefulWidget {
  const BackgroundCard({
    super.key,
  });

  @override
  State<BackgroundCard> createState() => _BackgroundCardState();
}

class _BackgroundCardState extends State<BackgroundCard> {
  @override
  void initState() {
    super.initState();
    Provider.of<HomeBackgroundCardProvider>(context, listen: false)
        .initializeBackgroundCard();
  }

  @override
  Widget build(BuildContext context) {
    var imageProvider = Provider.of<HomeBackgroundCardProvider>(context);
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 400,
          decoration:  BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(imageProvider.imageUrl ?? "image not found"),
            ),
          ),
        ),
        // Container(
        //   child: CarouselSlider(
        //     options: CarouselOptions(
        //       viewportFraction: 1,
        //       autoPlay: true,
        //       height: 300,
        //     ),
        //     items: [
        //       imageProvider
        //     ].map((i) {
        //       return Builder(builder: ((context) {
        //         return SizedBox(
        //           width: double.infinity,
        //           child: Row(
        //             children: [
        //               Image.network(i),
        //             ],
        //           ),
        //         );
        //       }));
        //     }).toList(),
        //   ),
        // ),
           const Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PlayButton(),
            ],
          ),
        )
      ],
    );
  }
}
