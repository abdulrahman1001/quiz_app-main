import 'package:flutter/material.dart';
import 'package:quiz_app/cubit/cubit/answerstate_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class scoreandquesnumber extends StatelessWidget {
  const scoreandquesnumber({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnswerstateCubit, AnswerstateState>(

      builder: (context, state) {
              int score=BlocProvider.of<AnswerstateCubit>(context).score;
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'question ${BlocProvider.of<AnswerstateCubit>(context).currentque+1}/${BlocProvider.of<AnswerstateCubit>(context).qlist.length}',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'score=${score}',
              style: TextStyle(fontSize: 20),
            ),
          ],
        );
      },
    );
  }
}
