import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quiz_app/model/questionmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';

part 'question_state.dart';

class QuestionCubit extends Cubit<QuestionState> {
  QuestionCubit() : super(QuestionInitial());

  String generateRandomNumbersString() {
    Random random = Random();
    String result = '';

    for (int i = 0; i < 4; i++) {
      int randomNumber =
          random.nextInt(10); // Generate a random number between 0 and 9
      result += randomNumber.toString();
    }

    return result;
  }

  CollectionReference exams = FirebaseFirestore.instance.collection('exams');
   Future<void> addquestions(List<questionmodel> questions) async {
  List<Map<String, dynamic>> examQuestions = [];

  for (questionmodel question in questions) {
    examQuestions.add({
      'question': question.question,
      'choices': question.choices.map((choice) => {choice.keys.first: choice.values.first}).toList(),
    });
  }

  String id = generateRandomNumbersString();

  // Assume 'exams' is a collection of exams in Firestore
  CollectionReference exams = FirebaseFirestore.instance.collection('exams');

  QuerySnapshot snapshot = await exams.where('exam.id', isEqualTo: id).limit(1).get();

  if (snapshot.docs.isEmpty) {
    emit(Questionsucess());
    try {
      await exams.add({
        'id': id,
        'questions': examQuestions,
      });
    } catch (e) {
      emit(QuestionError(message: e.toString()));
    }
  } else {
    emit(QuestionError(message: 'Document with ID $id already exists'));
  }
}


}

  
    
  

  

