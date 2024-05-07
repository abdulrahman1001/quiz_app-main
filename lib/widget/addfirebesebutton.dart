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
          var queslist = BlocProvider.of<AnswerstateCubit>(context).qlist.toSet().toList();
          BlocProvider.of<QuestionCubit>(context).addquestions(queslist,);
          for (var i = 0; i <queslist.length; i++){
            print(queslist[i].question);
          }
          BlocProvider.of<AnswerstateCubit>(context).qlist.clear();
        },
        child: Text('Add to Database'),
      ),
    );
  }
}
