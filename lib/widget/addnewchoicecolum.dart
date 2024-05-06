import 'package:flutter/material.dart';
import 'package:quiz_app/cubit/cubit/choice_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class addnewchoicecoulum extends StatelessWidget {
  const addnewchoicecoulum({super.key, required this.onPressed});
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          BlocProvider.of<ChoiceCubit>(context).addchoice();
          onPressed();
        },
        child: Text('add new choice'),
      ),
    );
  }
}
