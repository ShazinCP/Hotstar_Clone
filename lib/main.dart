import 'package:flutter/material.dart';
import 'package:hotstar/controller/bottom_navigation_controller/botton_nav_provider.dart';
import 'package:hotstar/controller/home_screen_controller/home_backgroundcard_provider.dart';
import 'package:hotstar/controller/internet_connectivity_controller/internet_connectivity_provider.dart';
import 'package:hotstar/controller/new_and_hot_controller/new_hot_provider.dart';
import 'package:hotstar/controller/search_controller/search_idl_provider.dart';
import 'package:hotstar/controller/search_controller/search_query_provider.dart';
import 'package:hotstar/controller/search_controller/search_result_provider.dart';
import 'package:hotstar/controller/home_screen_controller/top_rated_provider.dart';
import 'package:hotstar/controller/download_screen_controller/trending_movie_provider.dart';
import 'package:hotstar/helper/color.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotstar/view/main_page/main_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SelectedIndexProvider()),
        ChangeNotifierProvider(create: (context) => TrendingMovieProvider()),
        ChangeNotifierProvider(create: (context) => SearchQueryProvider()),
        ChangeNotifierProvider(create: (context) => SearchIDLProvider()),
        ChangeNotifierProvider(create: (context) => SearchResultProvider()),
        ChangeNotifierProvider(create: (context) => HomeScrollProvider()),
        ChangeNotifierProvider(create: (context) => NewAndHotProvider()),
        ChangeNotifierProvider(
            create: (context) => HomeBackgroundCardProvider()),
        ChangeNotifierProvider(create: (context) => TopRateProvider()),
        ChangeNotifierProvider(
            create: (context) => InternetConnectivityProvider()),
      ],
      child: MaterialApp(
        title: 'Disney Hotstar',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          appBarTheme: const AppBarTheme(backgroundColor: transparent),
          primarySwatch: cBlueColor,
          colorScheme: const ColorScheme.dark(),
          scaffoldBackgroundColor: backgroundcolor,
          fontFamily: GoogleFonts.poppins().fontFamily,
          textTheme: const TextTheme(
            bodyLarge: TextStyle(color: cWhiteColor),
            bodyMedium: TextStyle(color: cWhiteColor),
          ),
        ),
        home: MainScreen(),
      ),
    );
  }
}
