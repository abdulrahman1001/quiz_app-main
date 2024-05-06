import 'package:flutter/material.dart';
import 'package:quiz_app/cubit/cubit/answerstate_cubit.dart';
import 'package:quiz_app/cubit/cubit/choice_cubit.dart';
import 'package:quiz_app/widget/addchoice.dart';
import 'package:quiz_app/widget/choicebutton.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class choicelistview extends StatefulWidget {
  const choicelistview({super.key, });
  // final void Function (List<Map<String, bool>>) onssaved;
  @override
  State<choicelistview> createState() => _choicelistviewState();
}

class _choicelistviewState extends State<choicelistview> {
  List<Map<String, bool>> choices = List.generate(4, (_) => {'': false});

  @override
  Widget build(BuildContext context) {
    String question = BlocProvider.of<AnswerstateCubit>(context).question;
    return BlocListener<AnswerstateCubit, AnswerstateState>(
      listener: (context, state) {
        if (state is Answerstateadd) {
          question = BlocProvider.of<AnswerstateCubit>(context).question;
        }
      },
      child: Expanded(
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: AddChoiceForm(
                onssaved: (p0, bool p1) {
                  choices[index] = {p0: p1};
                  BlocProvider.of<AnswerstateCubit>(context)
                      .addques(choices, question);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
