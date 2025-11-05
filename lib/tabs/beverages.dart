import 'package:flutter/material.dart';

class Beverages extends StatefulWidget {
  const Beverages({super.key});

  @override
  _BeveragesState createState() => _BeveragesState();
}

class _BeveragesState extends State<Beverages> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Beverages Tab Content',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}