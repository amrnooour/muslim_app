import 'package:flutter/material.dart';
import 'package:muslim_app/ui/home/home_screen.dart';
import 'package:muslim_app/ui/screens/details_screen/details_screen.dart';
import 'package:muslim_app/ui/screens/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.routeName :(_)=>SplashScreen(),
        HomeScreen.routeName :(_)=>HomeScreen(),
        DetailsScreen.routeName :(_)=> DetailsScreen(),
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
