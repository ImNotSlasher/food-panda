import 'package:flutter/material.dart';

class Popular extends StatefulWidget {
  const Popular({super.key});

  @override
  _PopularState createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Popular Tab Content',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
