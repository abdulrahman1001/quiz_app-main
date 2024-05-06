import 'package:flutter/material.dart';
import 'package:quiz_app/cubit/cubit/answerstate_cubit.dart';
import 'package:quiz_app/cubit/cubit/choice_cubit.dart';
import 'package:quiz_app/cubit/cubit/question_cubit.dart';
import 'package:quiz_app/view/addquestionspage.dart';
import 'package:quiz_app/view/answerpage.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/view/homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
    WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AnswerstateCubit(),),
          BlocProvider(create: (context) => QuestionCubit(),),
             BlocProvider(create: (context) => ChoiceCubit(),)
      ],
      child: MaterialApp(
        home: addquietionpage(),
      ),
    );
  }
}
