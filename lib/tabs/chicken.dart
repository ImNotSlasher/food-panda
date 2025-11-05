import 'package:flutter/material.dart';

class Chicken extends StatefulWidget {
  const Chicken({super.key});

  @override
  _ChickenState createState() => _ChickenState();
}

class _ChickenState extends State<Chicken> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Chicken Tab Content',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}