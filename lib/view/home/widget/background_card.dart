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
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: double.infinity,
              height: 380,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image:
                      NetworkImage(imageProvider.imageUrl ?? "image not found"),
                  fit: BoxFit.fill,
                ),
              ),
            )

            // Container(
            //   child: CarouselSlider(
            //     options: CarouselOptions(
            //       viewportFraction: 1,
            //       autoPlay: true,
            //       autoPlayInterval:
            //           const Duration(seconds: 10), // Set duration to 20 seconds
            //       height: 300,
            //     ),
            //     items: [
            //       imageProvider,
            //       imageProvider,
            //       imageProvider, // Assuming this is an instance of HomeBackgroundCardProvider
            //     ].map((i) {
            //       return Builder(builder: ((context) {
            //         // Extract the image URL from the HomeBackgroundCardProvider instance
            //         String? imageUrl = i
            //             .imageUrl; // Replace 'imageUrl' with the actual property name

            //         if (imageUrl != null && imageUrl.isNotEmpty) {
            //           return SizedBox(
            //             width: double.infinity,
            //             height: 300, // Set a fixed height for the Container
            //             child: Row(
            //               children: [
            //                 Expanded(
            //                   child: Container(
            //                     width: double
            //                         .infinity, // Make the container take full width
            //                     child: Image.network(
            //                       imageUrl,
            //                       fit: BoxFit
            //                           .cover, // Adjust the image fit as needed
            //                     ),
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           );
            //         } else {
            //           // Handle the case when the URL is not available, e.g., show a placeholder image
            //           return SizedBox(
            //             width: double.infinity,
            //             height: 300, // Set a fixed height for the Container
            //             child: Center(
            //               child: Text("Image not available"),
            //             ),
            //           );
            //         }
            //       }));
            //     }).toList(),
            //   ),
            // )

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
            //               Image.network(i)
            //             ],
            //           ),
            //         );
            //       }));
            //     }).toList(),
            //   ),
            // ),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: PlayButton(),
            ),
          ],
        )
      ],
    );
  }
}
