import 'package:arabic_to_english_converter_app/screens/result_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'dart:math';
// import 'package:flutter_projects/screens/result_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuizScreen extends StatefulWidget {
  final String categoryTitle;
  final List<Map<String, dynamic>> questions;

  const QuizScreen(
      {required this.categoryTitle, required this.questions, super.key});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  final Map<int, String?> selectedAnswers = {};
  late List<String?> currentOptions;
  late String currentQuestion;
  late List<Map<String, dynamic>> shuffledQuestions;

  @override
  void initState() {
    super.initState();
    _shuffleQuestions();
    _setCurrentQuestion();
  }

  void _shuffleQuestions() {
    shuffledQuestions = List.from(widget.questions);
    shuffledQuestions.shuffle(Random());
  }

  void _setCurrentQuestion() {
    if (shuffledQuestions.isNotEmpty) {
      currentQuestion = shuffledQuestions[currentQuestionIndex]['question'];
      currentOptions =
          List<String?>.from(shuffledQuestions[currentQuestionIndex]['options'])
            ..shuffle(Random());
    }
  }

  @override
  Widget build(BuildContext context) {
    if (shuffledQuestions.isEmpty) {
      return const Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Text(
            'No questions available',
            style: TextStyle(color: Colors.orange, fontSize: 20),
          ),
        ),
      );
    }

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryTitle).tr(),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Status Card at the Top Right
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Card(
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Question ${currentQuestionIndex + 1} of ${shuffledQuestions.length}',
                          style: TextStyle(
                              fontSize: screenWidth * 0.045,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                // Question Card
                Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Center(
                      child: Text(
                        currentQuestion,
                        style: TextStyle(fontSize: screenWidth * 0.05),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                // Options
                Column(
                  children: currentOptions.map((option) {
                    return Card(
                      elevation: 4,
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ListTile(
                        title: Text(option!,
                            style: TextStyle(fontSize: screenWidth * 0.045)),
                        leading: Radio<String?>(
                          value: option,
                          groupValue: selectedAnswers[currentQuestionIndex],
                          onChanged: (value) {
                            setState(() {
                              selectedAnswers[currentQuestionIndex] = value;
                            });
                          },
                          activeColor: Colors.green,
                        ),
                        onTap: () {
                          setState(() {
                            selectedAnswers[currentQuestionIndex] = option;
                          });
                        },
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 24),
                // Navigation Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (currentQuestionIndex > 0)
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            currentQuestionIndex--;
                            _setCurrentQuestion();
                          });
                        },
                        child: const Text('Previous Question'),
                      ),
                    // Conditional Submit Button
                    if (currentQuestionIndex == shuffledQuestions.length - 1)
                      ElevatedButton(
                        onPressed: () {
                          _showSubmitConfirmation();
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.green,
                        ),
                        child: Text('Submit Quiz'.tr()),
                      ),
                    // Conditional Next Question Button
                    if (currentQuestionIndex < shuffledQuestions.length - 1)
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            currentQuestionIndex++;
                            _setCurrentQuestion();
                          });
                        },
                        child: const Text('Next Question'),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showSubmitConfirmation() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Submit Quiz'.tr()),
          content: Text('Are you sure you want to submit the quiz?'.tr()),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'.tr(),
                  style: const TextStyle(color: Colors.red)),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _submitQuiz();
              },
              child: Text('Submit'.tr(),
                  style: const TextStyle(color: Colors.green)),
            ),
          ],
        );
      },
    );
  }

  void _submitQuiz() async {
    int score = 0;
    final correctAnswers = <int, String?>{};

    for (int i = 0; i < shuffledQuestions.length; i++) {
      final question = shuffledQuestions[i];
      final selectedAnswer = selectedAnswers[i];
      if (selectedAnswer == question['answer']) {
        score++;
      }
      correctAnswers[i] = question['answer'];
    }

    // Save completed quiz category to SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> completedQuizzes =
        prefs.getStringList('completed_quizzes') ?? [];

    if (!completedQuizzes.contains(widget.categoryTitle)) {
      completedQuizzes.add(widget.categoryTitle);
      await prefs.setStringList('completed_quizzes', completedQuizzes);
    }

    // Navigate to result screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(
          score: score,
          totalQuestions: shuffledQuestions.length,
          selectedAnswers: selectedAnswers,
          correctAnswers: correctAnswers,
        ),
      ),
    );
  }
}
