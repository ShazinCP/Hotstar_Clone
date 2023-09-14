import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hotstar/constants/constants.dart';
import 'package:hotstar/controller/trending_movie_provider.dart';
import 'package:hotstar/view/main_page/main_screen.dart';
import 'package:provider/provider.dart';

class CenterSection extends StatefulWidget {
  const CenterSection({super.key});

  @override
  State<CenterSection> createState() => _CenterSectionState();
}

class _CenterSectionState extends State<CenterSection> {
  @override
  void initState() {
    super.initState();
    Provider.of<TrendingMovieProvider>(context, listen: false)
        .initializeImages();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        cHeight,
        Center(
          child: SizedBox(
            width: size.width,
            height: size.width,
            child: Consumer<TrendingMovieProvider>(
              builder: (context, value, child) {
                if (value.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (value.imageList.isEmpty) {
                  return const Text("No data available");
                } else {
                  return Stack(
                    alignment: Alignment.center,
                    children: value.imageList.length < 3
                        ? []
                        : [
                            CircleAvatar(
                              radius: size.width * 0.37,
                              backgroundColor: Colors.grey.withOpacity(0.5),
                            ),
                            DownloadsImageWidget(
                              imageList: value.imageList[0],
                              margin: const EdgeInsets.only(left: 170, top: 38),
                              angle: 25,
                              size: Size(size.width * 0.35, size.width * 0.55),
                            ),
                            DownloadsImageWidget(
                              imageList: value.imageList[1],
                              margin:
                                  const EdgeInsets.only(right: 170, top: 38),
                              angle: -25,
                              size: Size(size.width * 0.35, size.width * 0.55),
                            ),
                            DownloadsImageWidget(
                              imageList: value.imageList[2],
                              margin:
                                  const EdgeInsets.only(bottom: 25, top: 38),
                              size: Size(size.width * 0.4, size.width * 0.6),
                              radius: 8,
                            ),
                          ],
                  );
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}

class BottomSection extends StatelessWidget {
  const BottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "No Downloads Available",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        cHeight5,
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Explore and download your favourite movies and",
              style: TextStyle(fontSize: 10, color: Colors.grey),
            ),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "shows to watch on the go",
              style: TextStyle(
                fontSize: 10,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 35,
              width: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => MainScreen(),
                  ));
                },
                child: const Text(
                  "Go to Home",
                  style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget({
    super.key,
    required this.imageList,
    required this.size,
    this.angle = 0,
    this.radius = 10,
    required EdgeInsets this.margin,
  });
  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle * pi / 180,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(imageList))),
          ),
        ),
      ),
    );
  }
}
