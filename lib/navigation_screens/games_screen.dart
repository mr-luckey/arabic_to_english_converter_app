import 'package:arabic_to_english_converter_app/screens/list_of_gimified_q_and_a.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter_projects/screens/list_of_gimified_q_and_a.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:easy_localization/easy_localization.dart';

class CategorySelectionScreen extends StatelessWidget {
  const CategorySelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text(
            'Gamified Experience',
            style: TextStyle(fontSize: 18),
          ).tr(),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CategoryButton(
                categoryName: 'Animals',
                questions: getAnimalQuestions(),
                color: Colors.orangeAccent,
                icon: Icons.pets,
              ),
              CategoryButton(
                categoryName: 'Colors',
                questions: getColorQuestions(),
                color: Colors.pinkAccent,
                icon: Icons.color_lens,
              ),
              CategoryButton(
                categoryName: 'Numbers',
                questions: getNumberQuestions(),
                color: Colors.blueAccent,
                icon: Icons.format_list_numbered,
              ),
              CategoryButton(
                categoryName: 'Shapes',
                questions: getShapeQuestions(),
                color: Colors.greenAccent,
                icon: Icons.category,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String categoryName;
  final List<Question> questions;
  final Color color;
  final IconData icon;

  const CategoryButton({
    super.key,
    required this.categoryName,
    required this.questions,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          minimumSize: Size(
              MediaQuery.of(context).size.width * 0.7, 60), // Responsive width
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 5,
        ),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => QuizScreen(
                questions: questions,
                categoryName: categoryName, // Pass category name to QuizScreen
              ),
            ),
          );
        },
        icon: Icon(icon, size: 28, color: Colors.white),
        label: Text(
          'Start $categoryName Game',
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ).tr(),
      ),
    );
  }
}

class QuizScreen extends StatefulWidget {
  final List<Question> questions;
  final String categoryName;

  const QuizScreen({
    super.key,
    required this.questions,
    required this.categoryName,
  });

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  int score = 0;
  bool quizEnded = false;
  AudioPlayer audioPlayer = AudioPlayer();

  List<Question> shuffledQuestions = [];
  List<int> shuffledAnswerIndices = [];

  @override
  void initState() {
    super.initState();

    // Shuffle the questions once when the quiz starts
    shuffledQuestions = widget.questions..shuffle();

    // Shuffle the options for the first question
    shuffleAnswerOptions(currentQuestionIndex);
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  // Play the sound of the current question
  void playSound(String path) async {
    await audioPlayer.play(AssetSource(path));
  }

  // Shuffle answer options and update correct answer index
  void shuffleAnswerOptions(int questionIndex) {
    Question question = shuffledQuestions[questionIndex];
    List<int> indices = List<int>.generate(
        question.options.length, (i) => i); // Generate index list
    indices.shuffle(); // Shuffle indices

    setState(() {
      shuffledAnswerIndices = indices;
    });
  }

  // Get the correct answer index in the shuffled list
  int getCorrectAnswerIndex() {
    int originalIndex =
        shuffledQuestions[currentQuestionIndex].correctAnswerIndex;
    return shuffledAnswerIndices.indexOf(originalIndex);
  }

  // When user selects an answer
  void selectAnswer(int selectedIndex) {
    if (!quizEnded) {
      if (selectedIndex == getCorrectAnswerIndex()) {
        setState(() {
          score++; // Increment the score
        });
      }

      if (currentQuestionIndex < shuffledQuestions.length - 1) {
        setState(() {
          currentQuestionIndex++;
          shuffleAnswerOptions(
              currentQuestionIndex); // Shuffle the next question's options
        });
      } else {
        // Save achievement when the quiz ends
        saveAchievement();

        // Show the result dialog
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Great Job!').tr(),
            content:
                Text('You scored $score out of ${shuffledQuestions.length}.')
                    .tr(),
            actions: [
              TextButton(
                onPressed: () {
                  setState(() {
                    quizEnded = true;
                  });
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text('OK').tr(),
              ),
            ],
          ),
        );
      }
    }
  }

  // Save the quiz name to completed quizzes in SharedPreferences
  void saveAchievement() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> completedQuizzes =
        prefs.getStringList('completed_quizzes') ?? [];

    if (!completedQuizzes.contains(widget.categoryName)) {
      completedQuizzes.add(widget.categoryName); // Add the quiz name
      await prefs.setStringList('completed_quizzes', completedQuizzes);
    }
  }

  @override
  Widget build(BuildContext context) {
    Question currentQuestion = shuffledQuestions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz').tr(),
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Score: $score'.tr(),
              style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.cyan),
            ),
            const SizedBox(height: 40),
            Text(
              'Question ${currentQuestionIndex + 1} of ${shuffledQuestions.length}',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Center(
                child: const Text(
              'Select The Correct Image According To Sound Button',
              style: TextStyle(fontSize: 15),
            ).tr()),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Display the shuffled image options in a Card style
                for (int i = 0; i < 2; i++)
                  OptionCard(
                    imagePath:
                        currentQuestion.options[shuffledAnswerIndices[i]],
                    onTap: () => selectAnswer(i),
                  ),
              ],
            ),
            const SizedBox(height: 50),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.cyan),
                borderRadius: BorderRadius.circular(50),
                color: Colors.tealAccent.withOpacity(0.2),
              ),
              child: IconButton(
                icon: const Icon(Icons.volume_up, size: 40, color: Colors.cyan),
                onPressed: () {
                  playSound(currentQuestion.soundPath);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OptionCard extends StatelessWidget {
  final String imagePath;
  final VoidCallback onTap;

  const OptionCard({
    super.key,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 8,
        shadowColor: Colors.grey.withOpacity(0.3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            imagePath,
            width: 150,
            height: 150,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}

class Question {
  final String soundPath;
  final List<String> options;
  final int correctAnswerIndex;

  Question({
    required this.soundPath,
    required this.options,
    required this.correctAnswerIndex,
  });
}
