import 'package:arabic_to_english_converter_app/lessons_screens/beginner/alphabet_screen.dart';
import 'package:arabic_to_english_converter_app/lessons_screens/beginner/basic_vocabulary.dart';
import 'package:arabic_to_english_converter_app/lessons_screens/beginner/colors_screen.dart';
import 'package:arabic_to_english_converter_app/lessons_screens/beginner/digits_screen.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter_projects/lessons_screens/beginner/alphabet_screen.dart';
// import 'package:flutter_projects/lessons_screens/beginner/basic_vocabulary.dart';
// import 'package:flutter_projects/lessons_screens/beginner/colors_screen.dart';
// import 'package:flutter_projects/lessons_screens/beginner/digits_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../lessons_screens/advanced/conditional_screen.dart';
import '../lessons_screens/advanced/past_simple_tense_screen.dart';
import '../lessons_screens/advanced/present_simple_tense_screen.dart';
import '../lessons_screens/advanced/reported_speech_screen.dart';
import '../lessons_screens/intermediate/basic_greetings.dart';
import '../lessons_screens/intermediate/everyday_conversations_screen.dart';
import '../lessons_screens/intermediate/pronouns_and_prepositions_screen.dart';
import '../lessons_screens/intermediate/simple_sentences.dart';

class Lessons extends StatefulWidget {
  const Lessons({super.key});

  @override
  _LessonsState createState() => _LessonsState();
}

class _LessonsState extends State<Lessons> {
  late List<LessonData> lessons;

  @override
  void initState() {
    super.initState();
    // Initialize the lesson data
    lessons = [
      LessonData(
        title: 'Alphabet & Phonics'.tr(),
        description: 'Learn the English alphabet and basic sounds.'.tr(),
        image: 'assets/images/cards_background/alpha.jpg',
        screen: AlphabetScreen(), // Placeholder screen
        isLocked: false, // First lesson unlocked
        isCompleted: false,
      ),
      LessonData(
        title: 'Digits'.tr(),
        description: 'Learn digits from 1 to 10'.tr(),
        image: 'assets/images/cards_background/digits.jpg',
        screen: DigitsScreen(), // Placeholder screen
        isLocked: true,
        isCompleted: false,
      ),
      LessonData(
        title: 'Colors'.tr(),
        description: 'Know more about colors'.tr(),
        image: 'assets/images/cards_background/colors.jpg',
        screen: ColorsScreen(), // Placeholder screen
        isLocked: true,
        isCompleted: false,
      ),
      LessonData(
        title: 'Basic Vocabulary'.tr(),
        description:
            'Learn everyday words like colors, numbers, and more.'.tr(),
        image: 'assets/images/cards_background/voc.jpg',
        screen: BasicVocabularyScreen(), // Placeholder screen
        isLocked: true,
        isCompleted: false,
      ),
      LessonData(
        title: 'Basic Greetings'.tr(),
        description: 'Common phrases like "Hello" and "How are you?".'.tr(),
        image: 'assets/images/cards_background/gre.jpg',
        screen: BasicGreetingsScreen(),
        isLocked: true,
        isCompleted: false,
      ),
      LessonData(
        title: 'Simple Sentences'.tr(),
        description: 'Understanding simple sentence structures.'.tr(),
        image: 'assets/images/cards_background/sent.jpg',
        screen: SimpleSentencesScreen(),
        isLocked: true,
        isCompleted: false,
      ),
      LessonData(
        title: 'Pronouns & Prepositions'.tr(),
        description:
            'Learn how to use pronouns and prepositions properly.'.tr(),
        image: 'assets/images/cards_background/pre.jpg',
        screen: PronounsPrepositionsScreen(),
        isLocked: true,
        isCompleted: false,
      ),
      LessonData(
        title: 'Everyday Conversations'.tr(),
        description: 'Practice dialogues for common situations.'.tr(),
        image: 'assets/images/cards_background/conv.jpg',
        screen: EverydayConversationsScreen(),
        isLocked: true,
        isCompleted: false,
      ),
      LessonData(
        title: 'Present Simple Tense'.tr(),
        description: 'Forming sentences in the present tense.'.tr(),
        image: 'assets/images/cards_background/present.jpg',
        screen: PresentSimpleTenseScreen(),
        isLocked: true,
        isCompleted: false,
      ),
      LessonData(
        title: 'Past Simple Tense'.tr(),
        description:
            'Understanding and using the past simple tense correctly.'.tr(),
        image: 'assets/images/cards_background/past.jpg',
        screen: PastTenseScreen(),
        isLocked: true,
        isCompleted: false,
      ),
      LessonData(
        title: 'Conditionals'.tr(),
        description: 'Learn conditional sentences (if/then).'.tr(),
        image: 'assets/images/cards_background/if.png',
        screen: ConditionalsScreen(),
        isLocked: true,
        isCompleted: false,
      ),
      LessonData(
        title: 'Reported Speech'.tr(),
        description: 'How to report what others have said.'.tr(),
        image: 'assets/images/cards_background/rep.jpg',
        screen: ReportedSpeechScreen(),
        isLocked: true,
        isCompleted: false,
      ),
    ];

    loadLessonUnlockStatus();
  }

  // Load lesson unlock status from shared preferences
  void loadLessonUnlockStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    for (int i = 0; i < lessons.length; i++) {
      bool isUnlocked = prefs.getBool('lesson_$i') ?? (i == 0);
      setState(() {
        lessons[i].isLocked = !isUnlocked;
        lessons[i].isCompleted = prefs.getBool('completed_lesson_$i') ?? false;
      });
    }
  }

  // Reset all lessons to locked state and clear progress and achievements
  void resetLessons() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Reset all lessons to locked and not completed
    for (int i = 0; i < lessons.length; i++) {
      await prefs.setBool('lesson_$i', false); // Lock all lessons
      await prefs.setBool(
          'completed_lesson_$i', false); // Reset completion status
    }

    // Clear progress and achievements
    await prefs.remove('progress_lessons'); // Remove the progress lessons list
    await prefs
        .remove('achievement_lessons'); // Remove the achievements lessons list

    loadLessonUnlockStatus(); // Reload the lessons' lock status after reset
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: const Text(
          'Your Lessons',
          style: TextStyle(fontSize: 18),
        ).tr()),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildLessonRow(context, lessons),
                ],
              ),
            ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     showDialog(
      //       context: context,
      //       builder: (BuildContext context) {
      //         return AlertDialog(
      //           title: const Text('Reset All Lessons').tr(),
      //           content: const Text(
      //               'Are you sure you want to reset all lessons to locked state?')
      //               .tr(),
      //           actions: [
      //             TextButton(
      //               onPressed: () {
      //                 Navigator.of(context).pop();
      //               },
      //               child: const Text('No').tr(),
      //             ),
      //             TextButton(
      //               onPressed: () {
      //                 resetLessons();
      //                 Navigator.of(context).pop(); // Close the dialog
      //               },
      //               child: const Text('Yes').tr(),
      //             ),
      //           ],
      //         );
      //       },
      //     );
      //   },
      //   backgroundColor: Colors.cyan,
      //   child: const Icon(Icons.refresh),
      // ),
    );
  }

  // Function to build a row of lesson cards
  Widget buildLessonRow(BuildContext context, List<LessonData> lessons) {
    return Column(
      children:
          lessons.map((lesson) => buildLessonCard(context, lesson)).toList(),
    );
  }

  // Function to build a single lesson card
  Widget buildLessonCard(BuildContext context, LessonData lesson) {
    return GestureDetector(
      onTap: () {
        if (lesson.isLocked) {
          // Check if the previous lesson is completed
          int currentIndex = lessons.indexOf(lesson);
          if (currentIndex > 0 && !lessons[currentIndex - 1].isCompleted) {
            // Show confirmation dialog
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(lesson.title).tr(),
                  content: const Text(
                          'Complete the previous lesson to unlock this one.')
                      .tr(),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog
                      },
                      child: const Text('OK').tr(),
                    ),
                  ],
                );
              },
            );
          } else {
            // Show confirmation dialog when the card is tapped
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(lesson.title).tr(),
                  content:
                      const Text('Do you want to unlock this lesson?').tr(),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog
                      },
                      child: const Text('No').tr(),
                    ),
                    TextButton(
                      onPressed: () {
                        unlockLesson(lesson);
                        Navigator.of(context).pop(); // Close the dialog
                        // Navigate to the specified screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => lesson.screen),
                        );
                      },
                      child: const Text('Yes').tr(),
                    ),
                  ],
                );
              },
            );
          }
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => lesson.screen),
          );
        }
      },
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: lesson.isCompleted
            ? Colors.green[600]
            : Colors.grey, // Change card color if completed
        child: Column(
          children: [
            Stack(
              children: [
                // Lesson image
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Image.asset(
                    lesson.image,
                    fit: BoxFit.fill,
                    width: double.infinity,
                    height: 250,
                  ),
                ),
                // Locked icon overlay
                if (lesson.isLocked)
                  Positioned.fill(
                    child: Container(
                      color: Colors.black.withOpacity(0.6),
                      child: const Center(
                        child: Icon(
                          Icons.lock,
                          color: Colors.white,
                          size: 70,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Lesson title and description
                  Text(
                    lesson.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    lesson.description,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  // Completed checkbox
                  CheckboxListTile(
                    title: const Text('Completed').tr(),
                    value: lesson.isCompleted,
                    onChanged: lesson.isLocked || lesson.isCompleted
                        ? null
                        : (value) {
                            setState(() {
                              lesson.isCompleted = value ?? false;
                            });
                            completeLesson(lesson);
                          },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Unlock a lesson and store progress in SharedPreferences
  void unlockLesson(LessonData lesson) async {
    int index = lessons.indexOf(lesson);
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Unlock the lesson
    await prefs.setBool('lesson_$index', true);

    // Add the lesson to the "In Progress" list in SharedPreferences
    List<String>? progressLessons =
        prefs.getStringList('progress_lessons') ?? [];
    if (!progressLessons.contains(lesson.title)) {
      progressLessons.add(lesson.title);
      await prefs.setStringList('progress_lessons', progressLessons);
    }

    loadLessonUnlockStatus(); // Reload lessons after unlocking
  }

  // Mark a lesson as completed and store progress in SharedPreferences
// Mark a lesson as completed and store progress in SharedPreferences
  void completeLesson(LessonData lesson) async {
    int index = lessons.indexOf(lesson);
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Mark lesson as completed
    await prefs.setBool('completed_lesson_$index', true);

    // Remove the lesson from the "In Progress" list
    List<String>? progressLessons =
        prefs.getStringList('progress_lessons') ?? [];
    if (progressLessons.contains(lesson.title)) {
      progressLessons.remove(lesson.title);
      await prefs.setStringList('progress_lessons', progressLessons);
    }

    // Add the lesson to the "Completed" list in SharedPreferences (Achievements)
    List<String>? completedLessons =
        prefs.getStringList('achievement_lessons') ?? [];
    if (!completedLessons.contains(lesson.title)) {
      completedLessons.add(lesson.title);
      await prefs.setStringList('achievement_lessons', completedLessons);
    }

    loadLessonUnlockStatus(); // Reload lessons after completion
  }
}

// LessonData class to hold lesson details
class LessonData {
  final String title;
  final String description;
  final String image;
  final Widget screen;
  bool isLocked;
  bool isCompleted;

  LessonData({
    required this.title,
    required this.description,
    required this.image,
    required this.screen,
    required this.isLocked,
    required this.isCompleted,
  });
}
