import 'package:flutter/material.dart';
import 'package:hotstar/controller/bottom_navigation_controller/botton_nav_provider.dart';
import 'package:hotstar/helper/color.dart';
import 'package:provider/provider.dart';


class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SelectedIndexProvider>(
      builder: (context, value, child) {
        return BottomNavigationBar(
          backgroundColor: cBlackColor,
          currentIndex: value.selectedIndex,
          onTap: (index) {
            value.setIndex(index);
          },
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: cWhiteColor,
          unselectedItemColor: cGreyColor,
          selectedIconTheme: const IconThemeData(color: Colors.white),
          unselectedIconTheme: const IconThemeData(color: Colors.grey),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_filled,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                ),
                label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.flash_on_rounded,
                ),
                label: 'New & Hot'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.download_sharp,
                ),
                label: 'Downloads'),
          ],
        );
      },
    );
  }
}
