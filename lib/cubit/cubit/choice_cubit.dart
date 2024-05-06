import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'choice_state.dart';

class ChoiceCubit extends Cubit<ChoiceState> {
  ChoiceCubit() : super(ChoiceInitial());
 
  List choicelength = ['1', '2', '3', '4'];

  void addchoice() {
    choicelength.add('1');
    print(choicelength.length);
    emit(Choiceadd());
    
  }

}
