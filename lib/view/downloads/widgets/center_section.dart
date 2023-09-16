import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hotstar/constants/constants.dart';
import 'package:hotstar/controller/download_screen_controller/trending_movie_provider.dart';
import 'package:hotstar/controller/internet_connectivity_controller/internet_connectivity_provider.dart';
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
    Provider.of<InternetConnectivityProvider>(context, listen: false)
        .getInternetConnectivity(context);
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
