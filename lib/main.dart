import 'package:belanja/pages/home_page.dart';
import 'package:belanja/pages/item_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Belanja',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Inter',
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue.shade700,
          elevation: 0,
        ),
      ),
      initialRoute: '/',
      routes: {'/': (context) => HomePage(), '/item': (context) => ItemPage()},
      debugShowCheckedModeBanner: false,
    );
  }
}
