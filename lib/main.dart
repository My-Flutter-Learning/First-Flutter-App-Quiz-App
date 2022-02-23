import 'package:flutter/material.dart';

import 'package:first_app/quiz.dart';
import 'package:first_app/result.dart';

void main() {
  runApp(const MyApp());
}

// Another way of declaring the main function is as such
// void main() => runApp(MyApp());
// This method takes only one function and runs it.

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favourite colour?',
      'answers': [
        {'text': 'black', 'score': 10},
        {'text': 'red', 'score': 6},
        {'text': 'green', 'score': 3},
        {'text': 'white', 'score': 1}
      ]
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answers': [
        {'text': 'dog', 'score': 1},
        {'text': 'cat', 'score': 3},
        {'text': 'lion', 'score': 5},
        {'text': 'snake', 'score': 10}
      ]
    },
    {
      'questionText': 'What\'s your favourite snack?',
      'answers': [
        {'text': 'icecream', 'score': 3},
        {'text': 'crisps', 'score': 10},
        {'text': 'yogurt', 'score': 7},
        {'text': 'cookies', 'score': 9}
      ]
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
       _questionIndex = 0;
    _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore = _totalScore + score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);

    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('My First App'),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questions: _questions,
                  questionIndex: _questionIndex)
              : Result(_totalScore, _resetQuiz)),
    );
  }
}
