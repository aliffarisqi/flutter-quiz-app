import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_summary/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.choseenAnswere, required this.onRestart});

  final List<String> choseenAnswere;
  final void Function() onRestart;

  List<Map<String, Object>> getSumaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < choseenAnswere.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_question': questions[i].answere[0],
          'user_answer': choseenAnswere[i]
        },
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSumaryData();
    final numTotalQuestion = questions.length;
    final numCorrectQuestion = summaryData.where((data) {
      return data['user_answer'] == data['correct_question'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Your answered $numCorrectQuestion out of $numTotalQuestion question correctly",
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            QuestionSummary(summaryData),
            const SizedBox(height: 30),
            TextButton(
              onPressed: onRestart,
              child: const Text("Restart the Question"),
            )
          ],
        ),
      ),
    );
  }
}
