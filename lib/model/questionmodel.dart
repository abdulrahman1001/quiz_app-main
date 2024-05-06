class questionmodel {
  final String question;
  final List<Map<String, bool>> choices;

  questionmodel({required this.question, required this.choices});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is questionmodel &&
          runtimeType == other.runtimeType &&
          question == other.question &&
          choices == other.choices;

  @override
  int get hashCode => question.hashCode ^ choices.hashCode;
}
