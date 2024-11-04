class QuizQuestions {
  const QuizQuestions(this.text, this.answere);

  final String text;
  final List<String> answere;

  List<String> getShuffleAnswere() {
    final shuffledList = List.of(answere);
    shuffledList.shuffle();
    return shuffledList;
  }
}
