import 'package:chalo_webapp/Widgets/loader.dart';
import 'Screens/home_screen.dart';
import '../Data/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({  super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool hasInternet = true;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Route Transit Directory',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: kPrimarySwatch,
        fontFamily: 'Ubuntu',
        colorScheme: const ColorScheme.light(),
      ),
      home: hasInternet ? HomeScreen() : const LoaderAnimation(),
    );
  }
}
