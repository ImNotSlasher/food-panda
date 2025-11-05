import 'package:flutter/material.dart';

class Appetizer extends StatefulWidget {
  const Appetizer({super.key});

  @override
  _AppetizerState createState() => _AppetizerState();
}

class _AppetizerState extends State<Appetizer> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Appetizer Tab Content',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}