import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/cubit/cubit/answerstate_cubit.dart';

class choicebutton extends StatefulWidget {
  const choicebutton(
      {super.key,
      required this.choice,
      required this.answerstate,
      required this.buttonColor,
      required this.onPressed});
  final String choice;
  final bool answerstate;
  final Color buttonColor;
  final void Function() onPressed;

  @override
  State<choicebutton> createState() => _choicebuttonState();
}

class _choicebuttonState extends State<choicebutton> {

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
       

        widget.onPressed();

      },
      child: Text(widget.choice),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          BlocProvider.of<AnswerstateCubit>(context).isselect != null
              ? (widget.answerstate ? Colors.green : Colors.red)
              : widget.buttonColor,
        ),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
        minimumSize: MaterialStateProperty.all(Size(300, 50)),
      ),
    );
  }
}
