import 'package:flutter/material.dart';
import 'package:quizzler/quizbrain.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> results = [];

  int questionNumber = 0;

  void checkAnswer(bool userAnswer) {
    setState(() {
      if (quizBrain.checkAnswer(questionNumber, userAnswer)) {
        results.add(Icon(Icons.check, color: Colors.green));
      } else {
        results.add(Icon(Icons.close, color: Colors.red));
      }

      if (questionNumber < quizBrain.getQuestionsListLength() - 1) {
        questionNumber++;
      } else {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Bravo'),
            content: const Text('Vous avez terminé le quizz !!!'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context, 'Cancel');
                  setState(() {
                    questionNumber = 0;
                    results = [];
                  });
                },
                child: const Text('Rejouer ?'),
              ),
            ],
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestion(questionNumber),
                style: TextStyle(fontSize: 25.0, color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              child: const Text('True',
                  style: TextStyle(color: Colors.white, fontSize: 20.0)),
              onPressed: () {
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              child: const Text('False',
                  style: TextStyle(fontSize: 20.0, color: Colors.white)),
              onPressed: () {
                checkAnswer(false);
              },
            ),
          ),
        ),
        Divider(color: Colors.white),
        Center(
          child: Text('Résultats', style: TextStyle(color: Colors.white)),
        ),
        Row(
          children: results,
        ),
      ],
    );
  }
}
