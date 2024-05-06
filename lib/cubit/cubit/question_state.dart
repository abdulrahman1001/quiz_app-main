part of 'question_cubit.dart';

@immutable
sealed class QuestionState {}

final class QuestionInitial extends QuestionState {}

final class QuestionLoaded extends QuestionState {}

final class QuestionError extends QuestionState {
  final String message;

  QuestionError({required this.message});
}
final class Questionsucess extends QuestionState{}
