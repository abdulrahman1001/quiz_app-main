import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
part 'choice_state.dart';

class ChoiceCubit extends Cubit<ChoiceState> {
  ChoiceCubit() : super(ChoiceInitial());
  CollectionReference exams = FirebaseFirestore.instance.collection('exams');

  Future<bool> checkNumber(String id) async {
  QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore.instance
      .collection('exams')
      .get();

  for (QueryDocumentSnapshot<Map<String, dynamic>> documentSnapshot in querySnapshot.docs) {
    if (documentSnapshot.data().containsKey('id') && documentSnapshot.data()['id'] == id) {
      print(true);
      return true; // Found the number in one of the documents

    }
  }
print(false);
  return false; // Number not found in any document
}

}
