import 'package:flutter/material.dart';
import 'package:hotstar/controller/botton_nav_provider.dart';
import 'package:hotstar/view/downloads/download_screen.dart';
import 'package:hotstar/view/home/home_screen.dart';
import 'package:hotstar/view/main_page/widgets/bottom_nav.dart';
import 'package:hotstar/view/myspace/my_space_screen.dart';
import 'package:hotstar/view/new&hot/new_and_hot_screen.dart';
import 'package:hotstar/view/search/search_screen.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
   MainScreen({super.key});

  final pages = [
     const HomeScreen(),
     const SearchScreen(),
     const NewAndHotScreen(),
     const DownloadScreen(),
     const MySpaceScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Consumer<SelectedIndexProvider>(
          builder: (context, provider, _) {
            return provider.selectedIndex < pages.length
                ? pages[provider.selectedIndex]
                : const Center(child: Text("Not Found"));
          },
        ),
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
