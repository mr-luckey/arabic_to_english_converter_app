import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_tts/flutter_tts.dart';

class ReportedSpeechScreen extends StatelessWidget {
  final List<Map<String, String>> sentences = [
    {
      'question': 'He said, "I am happy."',
      'answer': 'He said that he was happy.',
      'translation': 'قال إنه سعيد.',
      'soundQuestion': 'sounds/reported_speech/he_said.mp3',
      'soundAnswer': 'sounds/reported_speech/he_said_that_he_was_happy.mp3',
    },
    {
      'question': 'She told me, "I will come."',
      'answer': 'She told me that she would come.',
      'translation': 'قالت لي إنها ستأتي.',
      'soundQuestion': 'sounds/reported_speech/she_told_me.mp3',
      'soundAnswer':
          'sounds/reported_speech/she_told_me_that_she_would_come.mp3',
    },
    {
      'question': 'They said, "We are leaving."',
      'answer': 'They said that they were leaving.',
      'translation': 'قالوا إنهم يغادرون.',
      'soundQuestion': 'sounds/reported_speech/they_said.mp3',
      'soundAnswer':
          'sounds/reported_speech/they_said_that_they_were_leaving.mp3',
    },
    {
      'question': 'John mentioned, "I can help you."',
      'answer': 'John mentioned that he could help me.',
      'translation': 'ذكر جون أنه يمكنه مساعدتي.',
      'soundQuestion': 'sounds/reported_speech/john_mentioned.mp3',
      'soundAnswer':
          'sounds/reported_speech/john_mentioned_that_he_could_help.mp3',
    },
    {
      'question': 'Mary said, "I love this song."',
      'answer': 'Mary said that she loved this song.',
      'translation': 'قالت ماري إنها تحب هذه الأغنية.',
      'soundQuestion': 'sounds/reported_speech/mary_said.mp3',
      'soundAnswer':
          'sounds/reported_speech/mary_said_that_she_loved_this_song.mp3',
    },
  ];

  ReportedSpeechScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reported Speech'),
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
