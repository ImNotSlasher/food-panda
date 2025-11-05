import 'package:flutter/material.dart';

class Crispypizza extends StatefulWidget {
  const Crispypizza({super.key});

  @override
  _CrispypizzaState createState() => _CrispypizzaState();
}

class _CrispypizzaState extends State<Crispypizza> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Crispypizza Tab Content',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}