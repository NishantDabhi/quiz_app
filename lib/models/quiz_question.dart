class QuizQuestion {

  QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffeledAnswers() {
    final shuffeledList = List.of(answers);
    shuffeledList.shuffle();
    return shuffeledList;
  }
}