// import 'package:flutter/material.dart';
// import 'package:hotstar/constants/constants.dart';
// import 'package:hotstar/view/home/widget/main_card.dart';
// import 'package:hotstar/view/home/widget/title_widget.dart';


// class MainTitleMovieCard extends StatelessWidget {
//   final String title;
//   // final String apiUrl;
//   const MainTitleMovieCard(
//       {super.key, required this.title});

//   @override
//   Widget build(BuildContext context) {
//           List imageList=[];

//     // return FutureBuilder(
//     //     future: apicall(apiUrl), builder: (context, snapshot) {
//     //       if (!snapshot.hasData) {
//     //         Center(
//     //                   child: Column(
//     //                     children: const [
//     //                       CircularProgressIndicator(color: Colors.blue,),
//     //                       Text('Please wait'),
//     //                     ],
//     //                   ),
//     //                 );
//     //       }

//     //       if (snapshot.data == null) {
//     //         return const Text('No data found');
//     //       }
//     //       if(snapshot.hasData){
//     //       imageList=snapshot.data.results.map((MovieInfoModel movieInfo) {
//     //           if (movieInfo.posterPath == null) {
//     //             return null;
//     //           }

//     //           String imageUrl =
//     //               'https://image.tmdb.org/t/p/w500${movieInfo.posterPath}?api_key=b2dee3b855c4ea705ff5dda3c0201768';
//     //           return imageUrl;
//     //         }).toList();
//     //         if(imageList.isEmpty){
//     //           return ListTile(title: Text('No $title'));
//     //         }
//     //       }
//           return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         TitleTextWidget(title: title),
//         cHeight,
//         SizedBox(
//           height: 225,
//           child: ListView.separated(
//             //padding: EdgeInsets.all(15),
//             scrollDirection: Axis.horizontal,
//             itemBuilder: (context, index) =>  MainCard(imageUrlFromApi:imageList[index]),
//             itemCount: 10,
//             separatorBuilder: (context, index) => cWidth,
//           ),
//         )
//       ],
//     );
//         }
//         // );
//   }
// // }