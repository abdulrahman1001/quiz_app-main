import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quiz_app/model/questionmodel.dart';

part 'answerstate_state.dart';

class AnswerstateCubit extends Cubit<AnswerstateState> {
  AnswerstateCubit() : super(AnswerstateInitial());
  int score = 0;
  int currentque = 0;
  int? isselect = null;
  bool isdone = false;
  List<questionmodel> qlist = [];
  String question = '';

  void isselectop(int index) {
    isselect = index;
  }

  void isselectnull() {
    isselect = null;
  }

  void trueanswer() {
    score++;
    currentque++;
    emit(Answerstatetrue());
  }

  void falseanswer() {
    currentque++;
    emit(Answerstatefalse());
  }

  bool isdoneop() {
    if (qlist.length == currentque) {
      return isdone = true;
    }
    return isdone = false;
  }

  addques(List<Map<String, bool>> choices, String question) {
    qlist.add(questionmodel(
      choices: choices,
      question: question,
    ));
  }

  addquestion(String value) {
    question = value;
    emit(Answerstateadd());
  }

  nextquesadd() {
    currentque++;

    emit(Answerstatcurrent());
  }
}
