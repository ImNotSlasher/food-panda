import 'package:flutter/material.dart';

class Cheesyhotdogpizza extends StatefulWidget {
  const Cheesyhotdogpizza({super.key});

  @override
  _CheesyhotdogpizzaState createState() => _CheesyhotdogpizzaState();
}

class _CheesyhotdogpizzaState extends State<Cheesyhotdogpizza> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Cheesyhotdogpizza Tab Content',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}