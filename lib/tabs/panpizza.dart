import 'package:flutter/material.dart';

class Panpizza extends StatefulWidget {
  const Panpizza({super.key});

  @override
  _PanpizzaState createState() => _PanpizzaState();
}

class _PanpizzaState extends State<Panpizza> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Panpizza Tab Content',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
