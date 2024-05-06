import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/cubit/cubit/answerstate_cubit.dart';
import 'package:quiz_app/cubit/cubit/question_cubit.dart';

class AddFirebaseButton extends StatelessWidget {
  const AddFirebaseButton({Key? key, required this.onPressed}) : super(key: key);
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          onPressed();
          var queslist = BlocProvider.of<AnswerstateCubit>(context).qlist;
          BlocProvider.of<QuestionCubit>(context).addquestions(queslist);
          for (var i = 0; i <queslist.length; i++){
            print(queslist[i].question);
          }
          BlocProvider.of<AnswerstateCubit>(context).qlist.clear();
          // BlocProvider.of<QuestionCubit>(context).ddquestions();
          // Access the current question and choices from AnswerstateCubit
          // String question = BlocProvider.of<AnswerstateCubit>(context).qlist[0].question;
          // List<Map<String, bool>> choices = [];
          // for (int i = 0; i < 4; i++) {
          //   choices.add(BlocProvider.of<AnswerstateCubit>(context).qlist[0].choices[i]);
          // }

          // // Add the question to the database using QuestionCubit
          // BlocProvider.of<QuestionCubit>(context).addquestions(question, choices);
        },
        child: Text('Add to Database'),
      ),
    );
  }
}
