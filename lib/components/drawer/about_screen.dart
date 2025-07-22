import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  // Method to launch a URL

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            'About This App'.tr(),
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Align text to the start
            children: <Widget>[
              const SizedBox(height: 16),
              Text(
                'Main Goal'.tr(),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Welcome to the English Language Learning App for Arabic Users! This version is designed to help Arabic speakers master English through interactive lessons, quizzes, and a gamified learning experience. Key features include progress tracking, achievements, and a community forum for connecting with other learners. This app will be updated in the future to support multiple languages, making language learning accessible to a wider audience.'
                    .tr(),
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 16),
              Text(
                'Advanced Features'.tr(),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'The English Language Learning App offers a wide range of interactive features designed to enhance your learning experience. It includes engaging lessons with videos, audio, and games to practice and improve your language skills. Users earn scores and experience points (XP) as they progress, and lessons are structured so that the next level cannot be accessed until the previous one is completed. Each lesson includes exams with varying levels of difficulty to test your knowledge.'
                    .tr(),
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 8),
              Text(
                'The app also supports language swapping between Arabic and English, as well as a dark and light mode to suit your preferences. The simple and user-friendly interface makes it easy to navigate and customize your study sessions.'
                    .tr(),
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Text(
                'In addition to educational content, the app provides entertainment sections featuring movie and series recommendations, music suggestions, and interactive games, including quizzes that challenge you to listen and select related images based on sounds. The progress and achievements section tracks your accomplishments, quiz scores, and overall progress.'
                    .tr(),
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Text(
                'The community forum allows users to add comments, like and dislike posts, create and delete their own posts, and interact with other learners. The app also integrates local and global data management, utilizing APIs to provide a rich and dynamic learning environment.'
                    .tr(),
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 16),
              Text(
                'Version'.tr(),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '1.0.0'.tr(),
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 16),
              Text(
                'Credits'.tr(),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Developed by Ahmed Tayseer\nUndergraduate Software Developer'
                    .tr(),
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 32),
              Text(
                'Contact Us'.tr(),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'For any questions, feedback, or support, please reach out to us at:\nahmedtayseer424@gmail.com'
                    .tr(),
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
