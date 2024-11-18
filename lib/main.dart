import 'package:flutter/material.dart';
import 'package:uts_mobile_programming_220010129/pages/country_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contry List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CountryListScreen(),
    );
  }
}
