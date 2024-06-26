import 'package:flutter/material.dart';
import 'package:quiz_app/cubit/cubit/answerstate_cubit.dart';
import 'package:quiz_app/widget/buttonlistview.dart';
import 'package:quiz_app/widget/choicebutton.dart';
import 'package:quiz_app/widget/quesdef.dart';
import 'package:quiz_app/widget/scoreandquesnumber.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/widget/scoreapper.dart';

class relleyanswerpage extends StatelessWidget {
  const relleyanswerpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnswerstateCubit, AnswerstateState>(
      builder: (context, state) {
        bool isdone = BlocProvider.of<AnswerstateCubit>(context).isdone;
        return Scaffold(
          appBar: AppBar(
            title: Text('quiz app'),
          ),
          body: isdone == true
              ? scoreapper()
              : Column(
                  children: [
                    scoreandquesnumber(),
                    questiondef(
                      question: BlocProvider.of<AnswerstateCubit>(context)
                          .qlist[BlocProvider.of<AnswerstateCubit>(context)
                              .currentque]
                          .question,
                    ),
                    Divider(
                      thickness: 2,
                      indent: 10,
                      endIndent: 10,
                    ),
                    ButtonListView(),
                  ],
                ),
        );
      },
    );
  }
}
