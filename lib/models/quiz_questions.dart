class QuizQuestion {
  final String question;
  final List<String> answers;

  const QuizQuestion(
    this.question,
    this.answers,
  );

  List<String> get shuffledAnswers {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}