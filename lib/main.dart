import 'package:flutter/material.dart';
import 'package:food_panda/home.dart';


void main() {
  runApp( PastaCornerApp(),
  );
}
class PastaCornerApp extends StatelessWidget {
  const PastaCornerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     home: const Home(),
    );
  }
}        

