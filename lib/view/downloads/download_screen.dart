import 'package:flutter/material.dart';
import 'package:hotstar/view/downloads/widgets/bottom_section.dart';
import 'package:hotstar/view/downloads/widgets/center_section.dart';


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
