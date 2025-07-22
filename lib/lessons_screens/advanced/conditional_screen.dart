import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_tts/flutter_tts.dart';

class ConditionalsScreen extends StatelessWidget {
  final List<Map<String, String>> sentences = [
    {
      'question': 'If it rains, I will stay home.',
      'answer': 'I will stay home if it rains.',
      'translation': 'إذا هطل المطر، سأبقى في المنزل.',
      'soundQuestion': 'sounds/conditionals/if_it_rains.mp3',
      'soundAnswer': 'sounds/conditionals/i_will_stay_home.mp3',
    },
    {
      'question': 'If you heat ice, it melts.',
      'answer': 'Ice melts if you heat it.',
      'translation': 'إذا سخنت الجليد، فإنه يذوب.',
      'soundQuestion': 'sounds/conditionals/if_you_heat_ice.mp3',
      'soundAnswer': 'sounds/conditionals/ice_melts.mp3',
    },
    {
      'question': 'If I have time, I will help you.',
      'answer': 'I will help you if I have time.',
      'translation': 'إذا كان لدي وقت، سأساعدك.',
      'soundQuestion': 'sounds/conditionals/if_i_have_time.mp3',
      'soundAnswer': 'sounds/conditionals/i_will_help_you.mp3',
    },
    {
      'question': 'If she studies, she will pass.',
      'answer': 'She will pass if she studies.',
      'translation': 'إذا درست، ستنجح.',
      'soundQuestion': 'sounds/conditionals/if_she_studies.mp3',
      'soundAnswer': 'sounds/conditionals/she_will_pass.mp3',
    },
    {
      'question': 'If they call, tell them I’m busy.',
      'answer': 'Tell them I’m busy if they call.',
      'translation': 'إذا اتصلوا، قل لهم أنني مشغول.',
      'soundQuestion': 'sounds/conditionals/if_they_call.mp3',
      'soundAnswer': 'sounds/conditionals/tell_them_im_busy.mp3',
    },
  ];

  ConditionalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conditionals'),
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
