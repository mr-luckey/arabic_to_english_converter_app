import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_tts/flutter_tts.dart';

class PresentSimpleTenseScreen extends StatelessWidget {
  final List<Map<String, String>> sentences = [
    {
      'question': 'He works every day.',
      'answer': 'He does work every day.',
      'translation': 'هو يعمل كل يوم.',
      'soundQuestion': 'sounds/present_simple/he_works.mp3',
      'soundAnswer': 'sounds/present_simple/he_does_work.mp3',
    },
    {
      'question': 'She plays the piano.',
      'answer': 'She does play the piano.',
      'translation': 'هي تعزف على البيانو.',
      'soundQuestion': 'sounds/present_simple/she_plays.mp3',
      'soundAnswer': 'sounds/present_simple/she_does_play.mp3',
    },
    {
      'question': 'They eat lunch at noon.',
      'answer': 'They do eat lunch at noon.',
      'translation': 'يتناولون الغداء في الظهيرة.',
      'soundQuestion': 'sounds/present_simple/they_eat.mp3',
      'soundAnswer': 'sounds/present_simple/they_do_eat.mp3',
    },
    {
      'question': 'We study English.',
      'answer': 'We do study English.',
      'translation': 'نحن ندرس الإنجليزية.',
      'soundQuestion': 'sounds/present_simple/we_study.mp3',
      'soundAnswer': 'sounds/present_simple/we_do_study.mp3',
    },
    {
      'question': 'I like ice cream.',
      'answer': 'I do like ice cream.',
      'translation': 'أنا أحب الآيس كريم.',
      'soundQuestion': 'sounds/present_simple/i_like.mp3',
      'soundAnswer': 'sounds/present_simple/i_do_like.mp3',
    },
  ];

  PresentSimpleTenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Present Simple Tense'),
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
