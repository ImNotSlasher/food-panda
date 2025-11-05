import 'package:flutter/material.dart';

class Specialoffer extends StatefulWidget {
  const Specialoffer({super.key});

  @override
  _SpecialofferState createState() => _SpecialofferState();
}

class _SpecialofferState extends State<Specialoffer> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Specialoffer Tab Content',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}