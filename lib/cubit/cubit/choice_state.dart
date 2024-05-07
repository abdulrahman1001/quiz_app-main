part of 'choice_cubit.dart';

@immutable
sealed class ChoiceState {}

final class ChoiceInitial extends ChoiceState {}

final class Choiceadd extends ChoiceState {}
final class Choiceacome extends ChoiceState {}
final class Choicedoenotcome extends ChoiceState {}


