import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Progress extends StatefulWidget {
  const Progress({super.key});

  @override
  _ProgressState createState() => _ProgressState();
}

class _ProgressState extends State<Progress> {
  List<String> progressLessons = [];
  List<String> achievementLessons = [];
  List<String> completedQuizzes = [];

  @override
  void initState() {
    super.initState();
    loadProgressAndAchievements();
  }

  void loadProgressAndAchievements() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      progressLessons = prefs.getStringList('progress_lessons') ?? [];
      achievementLessons = prefs.getStringList('achievement_lessons') ?? [];
      completedQuizzes = prefs.getStringList('completed_quizzes') ?? [];
    });
  }

  void resetProgress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('progress_lessons');
    setState(() {
      progressLessons.clear();
    });
  }

  void resetAchievements() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('achievement_lessons');
    setState(() {
      achievementLessons.clear();
    });
  }

  void resetQuizzes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('completed_quizzes');
    setState(() {
      completedQuizzes.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text(
            'Progress & Achievements',
            style: TextStyle(fontSize: 18),
          ).tr(),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: buildSectionTitle('In Progress')),
                const SizedBox(height: 10),
                Center(child: buildProgressList(progressLessons, 'No lessons in progress yet.')),
                const SizedBox(height: 20),
                Center(child: buildSectionTitle('Achievements')),
                const SizedBox(height: 10),
                Center(child: buildAchievementList(achievementLessons, 'No completed lessons yet.')),
                const SizedBox(height: 20),
                Center(child: buildSectionTitle('Completed Quizzes')),
                const SizedBox(height: 10),
                Center(child: buildCompletedQuizzesList(completedQuizzes, 'No completed quizzes yet.')),
                const SizedBox(height: 20),
                // Align reset button to the right and make it red
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: resetQuizzes,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red, // Set background color to red
                      ),
                      child: const Text(
                        'Reset Quizzes',
                        style: TextStyle(color: Colors.white),
                      ).tr(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: MediaQuery.of(context).size.width * 0.05,
      ),
    ).tr();
  }

  Widget buildProgressList(List<String> lessons, String emptyMessage) {
    return buildList(lessons, emptyMessage, Icons.work_outline, Colors.cyan);
  }

  Widget buildAchievementList(List<String> lessons, String emptyMessage) {
    return buildList(lessons, emptyMessage, Icons.emoji_events_outlined, Colors.amber);
  }

  Widget buildCompletedQuizzesList(List<String> quizzes, String emptyMessage) {
    return buildList(quizzes, emptyMessage, Icons.check_circle_outline, Colors.green);
  }

  Widget buildList(List<String> items, String emptyMessage, IconData icon, Color iconColor) {
    if (items.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Text(emptyMessage).tr(),
      );
    }

    return Card(
      elevation: 2,
      child: ListView.separated(
        separatorBuilder: (context, index) => const Divider(),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(icon, color: iconColor, size: 30),
            title: Text(
              items[index],
              style: const TextStyle(fontSize: 18),
            ),
          );
        },
      ),
    );
  }
}
