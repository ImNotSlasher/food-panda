import 'package:flutter/material.dart';

class Pasta extends StatefulWidget {
  const Pasta({super.key});
  @override
  _PastaState createState() => _PastaState();
}

class _PastaState extends State<Pasta> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Pasta Tab Content',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}