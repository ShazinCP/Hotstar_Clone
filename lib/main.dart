import 'package:flutter/material.dart';
import 'package:hotstar/controller/botton_nav_provider.dart';
import 'package:hotstar/controller/trending_movie_provider.dart';
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
        ChangeNotifierProvider(
            create: (context) => TrendingMovieInitializeProvider()),
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
            bodyLarge: TextStyle(color: Colors.white),
            bodyMedium: TextStyle(color: Colors.white),
          ),
        ),
        home: MainScreen(),
      ),
    );
  }
}
