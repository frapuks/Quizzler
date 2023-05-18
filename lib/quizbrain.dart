import 'package:quizzler/question.dart';

class QuizBrain {
  List<Question> _questionsList = [
    Question(label: 'Some cats are actually allergic to humans', answer: true),
    Question(
        label: 'You can lead a cow down stairs but not up stairs.',
        answer: false),
    Question(
        label: 'Approximately one quarter of human bones are in the feet.',
        answer: true),
    Question(label: 'A slug\'s blood is green.', answer: true),
    Question(
        label: 'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".',
        answer: true),
    Question(
        label: 'It is illegal to pee in the Ocean in Portugal.', answer: true),
    Question(
        label:
            'No piece of square dry paper can be folded in half more than 7 times.',
        answer: false),
    Question(
        label:
            'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        answer: true),
    Question(
        label:
            'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        answer: false),
    Question(
        label:
            'The total surface area of two human lungs is approximately 70 square metres.',
        answer: true),
    Question(label: 'Google was originally called \"Backrub\".', answer: true),
    Question(
        label:
            'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        answer: true),
    Question(
        label:
            'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        answer: true),
  ];

  getQuestion(int questionNumber) {
    return _questionsList[questionNumber].label;
  }

  getQuestionsListLength() {
    return _questionsList.length;
  }

  checkAnswer(int questionNumber, bool userAnswer) {
    return userAnswer == _questionsList[questionNumber].answer;
  }
}
