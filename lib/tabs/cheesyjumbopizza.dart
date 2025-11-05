import 'package:flutter/material.dart';

class Cheesyjumbopizza extends StatefulWidget {
  const Cheesyjumbopizza({super.key});

  @override
  _CheesyjumbopizzaState createState() => _CheesyjumbopizzaState();
}

class _CheesyjumbopizzaState extends State<Cheesyjumbopizza> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Cheesyjumbopizza Tab Content',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}