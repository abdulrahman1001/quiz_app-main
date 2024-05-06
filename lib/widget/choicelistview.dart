import 'package:flutter/material.dart';
import 'package:quiz_app/cubit/cubit/answerstate_cubit.dart';
import 'package:quiz_app/cubit/cubit/choice_cubit.dart';
import 'package:quiz_app/widget/addchoice.dart';
import 'package:quiz_app/widget/choicebutton.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class choicelistview extends StatefulWidget {
  const choicelistview({Key? key}) : super(key: key);

  @override
  State<choicelistview> createState() => _choicelistviewState();
}

class _choicelistviewState extends State<choicelistview> {
  List<Map<String, bool>> choices = List.generate(4, (index) => {'$index': false});


  @override
  Widget build(BuildContext context) {
    String question = BlocProvider.of<AnswerstateCubit>(context).question;
    final answerstateCubit = BlocProvider.of<AnswerstateCubit>(context);

    return BlocListener<AnswerstateCubit, AnswerstateState>(
      listener: (context, state) {
        if (state is Answerstateadd) {
          question = answerstateCubit.question;
        }
      },
      child: Expanded(
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: AddChoiceForm(
                onssaved: (String choice, bool isSelected) {
                  choices[index] = {choice: isSelected};
                  answerstateCubit.addques(choices, question);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
