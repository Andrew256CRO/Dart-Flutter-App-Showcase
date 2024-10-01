class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    // '.of' creates a new list based on another list
    // In order to keep the rack of the coorect answer, I must first make a list of the original list and then we call shuffle() on this new list
    // So the old list will be untouched
    // the shuffle method does not return anything, so we must first create a variable where we keep the copied list, then we shuffle and return
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
