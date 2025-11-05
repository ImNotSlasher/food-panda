import 'package:flutter/material.dart';

class Cheesecrustpizza extends StatefulWidget {
  const Cheesecrustpizza({super.key});

  @override
  _CheesecrustpizzaState createState() => _CheesecrustpizzaState();
}

class _CheesecrustpizzaState extends State<Cheesecrustpizza> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Cheesecrustpizza Tab Content',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}