import 'package:flutter/material.dart';
import 'package:hotstar/constants/constants.dart';
import 'package:hotstar/model/movie_model.dart';
import 'package:hotstar/services/base_client.dart';
import 'package:hotstar/view/home/widget/main_card.dart';
import 'package:hotstar/widgets/main_title.dart';

class MainTitleCard extends StatelessWidget {
  const MainTitleCard({super.key, required this.title, required this.apiUrl});

  final String title;
  final String apiUrl;

  @override
  Widget build(BuildContext context) {
    List imageList = [];
    return FutureBuilder(
      future: apiCall(apiUrl),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          const Center(
            child: Column(
              children: [
                CircularProgressIndicator(
                  color: Colors.blue,
                ),
                Text('Please wait'),
              ],
            ),
          );
        }
        if (snapshot.data == null) {
          return const Text('No data found');
        }

        if (snapshot.hasData) {
          imageList = snapshot.data.results.map((MovieModel movieInfo) {
            if (movieInfo.posterPath == null) {
              return null;
            }
            String imageUrl =
                'https://image.tmdb.org/t/p/w500${movieInfo.posterPath}?api_key=b2dee3b855c4ea705ff5dda3c0201768';
            return imageUrl;
          }).toList();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MainTitle(title: title),
            cHeight,
            SizedBox(
              height: 180,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => MainCardWidget(
                  imageUrlFromApi: imageList[index],
                ),
                itemCount: 10,
                separatorBuilder: (context, index) => cWidth,
              ),
            )
          ],
        );
      },
    );
  }
}
