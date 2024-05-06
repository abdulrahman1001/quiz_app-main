import 'package:flutter/material.dart';

class questiondef extends StatelessWidget {
  const questiondef({
    super.key, required this.question,
  });
  final String question;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        question,
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}
