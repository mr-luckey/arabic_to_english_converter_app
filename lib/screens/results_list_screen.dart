import 'package:arabic_to_english_converter_app/screens/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter_projects/screens/result_screen.dart';

class QuizResult {
  final String title;
  final int score;
  final int totalQuestions;
  final Map<int, String?> selectedAnswers;
  final Map<int, String?> correctAnswers;

  QuizResult({
    required this.title,
    required this.score,
    required this.totalQuestions,
    required this.selectedAnswers,
    required this.correctAnswers,
  });
}

class ResultsListScreen extends StatelessWidget {
  final List<QuizResult> quizResults;

  const ResultsListScreen({required this.quizResults, super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Quiz Results').tr(),
      ),
      body: ListView.builder(
        itemCount: quizResults.length,
        itemBuilder: (context, index) {
          final result = quizResults[index];

          return Card(
            elevation: 4,
            margin: EdgeInsets.symmetric(
              vertical: screenHeight * 0.01,
              horizontal: screenWidth * 0.04,
            ),
            child: ListTile(
              title: Text(
                result.title,
                style: TextStyle(fontSize: screenWidth * 0.05),
              ),
              subtitle: Text(
                'Score: ${result.score} / ${result.totalQuestions}',
                style: TextStyle(fontSize: screenWidth * 0.04),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultScreen(
                      score: result.score,
                      totalQuestions: result.totalQuestions,
                      selectedAnswers: result.selectedAnswers,
                      correctAnswers: result.correctAnswers,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
