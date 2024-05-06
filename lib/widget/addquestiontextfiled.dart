import 'package:flutter/material.dart';

class addquestiontextfiled extends StatelessWidget {
  const addquestiontextfiled({super.key, required this.onChanged});
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        onChanged:onChanged ,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'question',
        ),
        maxLines: 1,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
      ),
    );
  }
}