import 'package:flutter/material.dart';
import 'package:news_app/home/home_screen.dart';
import 'package:news_app/theme/my_theme_data.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.lightTheme,
      initialRoute: HomeScreen.routeHome,
      routes: {
        HomeScreen.routeHome : (context)=> HomeScreen(),
      },
    );
  }

}
void main(){
  runApp( const MyApp());
}
