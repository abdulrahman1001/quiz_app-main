import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/cubit/cubit/answerstate_cubit.dart';
import 'package:quiz_app/model/questionmodel.dart';
import 'package:quiz_app/view/answerpagere.dart';
import 'package:quiz_app/widget/buttonlistview.dart';
import 'package:quiz_app/widget/quesdef.dart';
import 'package:quiz_app/widget/scoreandquesnumber.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AnswerPage extends StatelessWidget {
  const AnswerPage({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  Widget build(BuildContext context) {
    CollectionReference exams = FirebaseFirestore.instance.collection('exams');

    return FutureBuilder<QuerySnapshot>(
      future: exams.where('id', isEqualTo: id).get(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            print("Error: ${snapshot.error}");
            return Text("Something went wrong");
          }

          if (snapshot.data!.docs.isNotEmpty) {
            // Use the ID of the first document found
            String examDocumentId = snapshot.data!.docs[0].id;
            return FutureBuilder<DocumentSnapshot>(
              future: exams.doc(examDocumentId).get(),
              builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    print("Error: ${snapshot.error}");
                    return Text("Something went wrong");
                  }

                  DocumentSnapshot<Object?> documentSnapshot = snapshot.data!;
                  if (documentSnapshot.exists) {
                    print("Document exists");
                    List<dynamic> questionsData =
                        (documentSnapshot.data() as Map<String, dynamic>)['questions'];
                    questionsData.forEach((questionData) {
                      List<Map<String, bool>> choices = List<Map<String, bool>>.from(
                          (questionData['choices'] as List<dynamic>)
                              .map((choice) => Map<String, bool>.from(choice)));
                      String question = questionData['question'] as String;
                      BlocProvider.of<AnswerstateCubit>(context)
                          .addques(choices, question);
                    });
                    return relleyanswerpage();
                  } else {
                    print("Document does not exist");
                    return Text("Document does not exist");
                  }
                }

                return Text("Loading");
              },
            );
          } else {
            print("No document found with ID: $id");
            return Text("No document found with ID: $id");
          }
        }

        return Text("Loading");
      },
    );
  }
}
