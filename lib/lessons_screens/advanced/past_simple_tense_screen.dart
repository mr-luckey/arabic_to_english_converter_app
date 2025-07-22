import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_tts/flutter_tts.dart';

class PastTenseScreen extends StatelessWidget {
  final List<Map<String, String>> sentences = [
    {
      'question': 'She visited her grandmother.',
      'answer': 'She did visit her grandmother.',
      'translation': 'لقد زارت جدتها.',
      'soundQuestion': 'sounds/past_simple/she_visited.mp3',
      'soundAnswer': 'sounds/past_simple/she_did_visit.mp3',
    },
    {
      'question': 'They watched a movie last night.',
      'answer': 'They did watch a movie last night.',
      'translation': 'شاهدوا فيلمًا الليلة الماضية.',
      'soundQuestion': 'sounds/past_simple/they_watched.mp3',
      'soundAnswer': 'sounds/past_simple/they_did_watch.mp3',
    },
    {
      'question': 'I studied hard for the exam.',
      'answer': 'I did study hard for the exam.',
      'translation': 'لقد درست بجد للامتحان.',
      'soundQuestion': 'sounds/past_simple/i_studied.mp3',
      'soundAnswer': 'sounds/past_simple/i_did_study.mp3',
    },
    {
      'question': 'He cleaned his room yesterday.',
      'answer': 'He did clean his room yesterday.',
      'translation': 'لقد نظف غرفته البارحة.',
      'soundQuestion': 'sounds/past_simple/he_cleaned.mp3',
      'soundAnswer': 'sounds/past_simple/he_did_clean.mp3',
    },
    {
      'question': 'We played soccer on Saturday.',
      'answer': 'We did play soccer on Saturday.',
      'translation': 'لقد لعبنا كرة القدم يوم السبت.',
      'soundQuestion': 'sounds/past_simple/we_played.mp3',
      'soundAnswer': 'sounds/past_simple/we_did_play.mp3',
    },
  ];

  PastTenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Past Simple Tense'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: sentences.length,
          itemBuilder: (context, index) {
            final sentence = sentences[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Q: ${sentence['question']}',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.volume_up, color: Colors.blue),
                          onPressed: () {
                            FlutterTts().speak(sentence['question']!);
                            // _playSound(sentence['soundQuestion']!);
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'A: ${sentence['answer']}',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.volume_up, color: Colors.blue),
                          onPressed: () {
                            FlutterTts().speak(sentence['answer']!);
                            // _playSound(sentence['soundAnswer']!);
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Translation: ${sentence['translation']}',
                      style: const TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // void _playSound(String soundPath) async {
  //   final audioPlayer = AudioPlayer();
  //   try {
  //     await audioPlayer.play(AssetSource(soundPath));
  //   } catch (e) {
  //     print("Error playing sound: $e");
  //   }
  // }
}
