import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:l02_advance/answer_button.dart';
import 'package:l02_advance/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  //var to change the question number by changing the state
  var currentQuestionIndex = 0;

  //method when answer button is clicked
  //move to next question and store the answer

  void answerQuestions(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestions = questions[currentQuestionIndex];

    return Center(
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestions.text,
              textAlign: TextAlign.center,
              style: GoogleFonts.baloo2(
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 0.0, height: 40),
            ...currentQuestions.getShuffledAnswer().map((answer) {
              return AnswerButton(
                answerText: answer,
                onTap: () {
                  answerQuestions(answer);
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
