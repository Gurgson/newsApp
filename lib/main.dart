import 'package:flutter/material.dart';
import 'package:simple_news_app/Views/home_page.dart';

 void main(){
  runApp(MyApp());
 }
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final int primary = 0xFF273043;
  final int secondary = 0xFF9197ae;
  final int tertiary = 0xFFeff6ee;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(
       
        // brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          brightness: Brightness.dark,
          primary: Color(primary),
          secondary:  Color(secondary),
          tertiary:  Color(primary),
          
        ),     
        scaffoldBackgroundColor: Color(primary), 
        
        fontFamily: 'Montserrat',
        
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(fontSize: 20, color: Color(0xFFeff6ee)),
          iconTheme: IconThemeData(color: Color(0xFFeff6ee)),
          backgroundColor: Color(0xFF273043)
        )
      ),

      home: const HomePage(),
      
    );
  }
}