import 'package:flutter/material.dart';
import 'package:pokedex_flutter/features/home/pages/home_loading.dart';
import 'package:pokedex_flutter/features/home/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeLoading(),
    );
  }
}
