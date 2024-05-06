part of 'answerstate_cubit.dart';

@immutable
sealed class AnswerstateState {}

final class AnswerstateInitial extends AnswerstateState {}

final class Answerstatetrue extends AnswerstateState {}

final class Answerstatefalse extends AnswerstateState {}
final class Answerstateadd extends AnswerstateState {}

final class Answerstatenext extends AnswerstateState {}

final class Answerstatcurrent extends AnswerstateState {}