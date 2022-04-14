import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'question.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuizBrain {
  int questionNumber = 0;
  List<Question> _questionBank = [
    Question(
        questionText: 'You can lead a cow down stairs but not up stairs.',
        questionAnswer: false),
    Question(
        questionText:
            'Approximately one quarter of human bones are in the feet.',
        questionAnswer: true),
    Question(questionText: 'A slug\'s blood is green.', questionAnswer: true)
  ];
  void nextQuestion(BuildContext context) {
    if (questionNumber < _questionBank.length - 1) {
      questionNumber++;
    } else {
      Alert(
              context: context,
              buttons: [
                DialogButton(
                  child: Text(
                    "OK",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () => Navigator.pop(context),
                  width: 120,
                )
              ],
              title: "Congratulationss",
              desc: "You are Finished our Quiz!!")
          .show();
    }
  }

  String getQuestionText() {
    return _questionBank[questionNumber].questionText;
  }

  bool getQuestionAnswer() {
    return _questionBank[questionNumber].questionAnswer;
  }
}
