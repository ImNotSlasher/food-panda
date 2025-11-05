import 'package:flutter/material.dart';

class Italianpizza extends StatefulWidget {
  const Italianpizza({super.key});

  @override
  _ItalianpizzaState createState() => _ItalianpizzaState();
}

class _ItalianpizzaState extends State<Italianpizza> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Italianpizza Tab Content',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}