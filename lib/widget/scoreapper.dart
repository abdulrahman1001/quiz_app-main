import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/cubit/cubit/answerstate_cubit.dart';
class scoreapper extends StatelessWidget {
  const scoreapper({super.key});

  @override
  Widget build(BuildContext context) {
   int score= BlocProvider.of<AnswerstateCubit>(context).score;
  int qlengt= BlocProvider.of<AnswerstateCubit>(context).qlist.length;
    return Column(
      children: [
        Text('your score is $score out of $qlengt',style: TextStyle(fontSize: 25),),
        Expanded(
          child: PieChart(
            PieChartData(
          // read about it in the PieChartData section
          sections: [
            PieChartSectionData(
              color: Colors.green,
              value: score.toDouble(),
              title: 'score',
              radius: 100,
            ),
            PieChartSectionData(
              color: Colors.red,
              value: (qlengt-score).toDouble(),
              title: 'allquestions',
              radius: 100,
            ),
          ]
            ),
            swapAnimationDuration: Duration(milliseconds: 150), // Optional
            swapAnimationCurve: Curves.linear, // Optional
          ),
        ),
      ],
    );
  }
}