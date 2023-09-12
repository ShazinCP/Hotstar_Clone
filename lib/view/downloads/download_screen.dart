import 'package:flutter/material.dart';
import 'package:hotstar/view/downloads/widgets/widgets.dart';

class DownloadScreen extends StatelessWidget {
  DownloadScreen({super.key});
  final widgetList = [
    const CenterSection(),
    const BottomSection(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
              title: const Text("Downloads"),
            ),
        body: ListView.separated(
            padding: const EdgeInsets.all(10),
            itemBuilder: (context, index) => widgetList[index],
            separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
            itemCount: widgetList.length));
  }
}


// import 'package:flutter/material.dart';
// import 'package:hotstar/view/downloads/widgets/download_image.dart';
// import 'package:hotstar/view/downloads/widgets/widgets.dart';

// class DownloadScreen extends StatelessWidget {
//   const DownloadScreen({super.key});

//   @override
//   Widget build(BuildContext context) {

//     final Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Downloads",
//           style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//         ),
//       ),
//       body:
//           const Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 "No Downloads Available",
//                 style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
//               ),
//             ],
//           ),
//            SizedBox(
//             height: 5,
//           ),
//           const Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 "Explore and download your favourite movies and",
//                 style: TextStyle(fontSize: 10, color: Colors.grey),
//               ),
//             ],
//           ),
//           const Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 "shows to watch on the go",
//                 style: TextStyle(
//                   fontSize: 10,
//                   color: Colors.grey,
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(
//             height: 15,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                   height: 35,
//                   width: 250,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     color: Colors.white,
//                   ),
//                   child: TextButton(
//                       onPressed: () {
//                         // Navigator.of(context).pushReplacement(MaterialPageRoute(
//                         //   builder: (context) => MainScreen(),
//                         // ));
//                       },
//                       child: const Text(
//                         "Go to Home",
//                         style: TextStyle(
//                             fontSize: 11,
//                             fontWeight: FontWeight.w700,
//                             color: Colors.black),
//                       )))
//             ],
//           ),
        
//       );
    
//   }
// }
