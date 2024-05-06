import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/cubit/cubit/answerstate_cubit.dart';

class NextQuestion extends StatelessWidget {
  const NextQuestion({super.key, required this.onPressed});
final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(16),
        height: 50,
        width: double.infinity,
        child: ElevatedButton(
          onPressed:onPressed,
          child: Text('Next Question'),
        ));
  }
}
