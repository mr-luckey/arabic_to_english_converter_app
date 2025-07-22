import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_tts/flutter_tts.dart';

class PronounsPrepositionsScreen extends StatelessWidget {
  final List<Map<String, String>> sentences = [
    {
      'question': 'What is your name?',
      'answer': 'My name is John.',
      'translation': 'ما اسمك؟',
      'soundQuestion': 'sounds/pronouns_prepositions/what_is_your_name.mp3',
      'soundAnswer': 'sounds/pronouns_prepositions/my_name_is_john.mp3',
    },
    {
      'question': 'Where do you live?',
      'answer': 'I live in New York.',
      'translation': 'أين تعيش؟',
      'soundQuestion': 'sounds/pronouns_prepositions/where_do_you_live.mp3',
      'soundAnswer': 'sounds/pronouns_prepositions/i_live_in_new_york.mp3',
    },
    {
      'question': 'How are you?',
      'answer': 'I am fine, thank you.',
      'translation': 'كيف حالك؟',
      'soundQuestion': 'sounds/pronouns_prepositions/how_are_you.mp3',
      'soundAnswer': 'sounds/pronouns_prepositions/i_am_fine_thank_you.mp3',
    },
    {
      'question': 'What do you do?',
      'answer': 'I am a teacher.',
      'translation': 'ماذا تعمل؟',
      'soundQuestion': 'sounds/pronouns_prepositions/what_do_you_do.mp3',
      'soundAnswer': 'sounds/pronouns_prepositions/i_am_a_teacher.mp3',
    },
    {
      'question': 'Can you help me?',
      'answer': 'Yes, I can help you.',
      'translation': 'هل يمكنك مساعدتي؟',
      'soundQuestion': 'sounds/pronouns_prepositions/can_you_help_me.mp3',
      'soundAnswer': 'sounds/pronouns_prepositions/yes_i_can_help_you.mp3',
    },
    {
      'question': 'Where is the book?',
      'answer': 'The book is on the table.',
      'translation': 'أين الكتاب؟',
      'soundQuestion': 'sounds/pronouns_prepositions/where_is_the_book.mp3',
      'soundAnswer':
          'sounds/pronouns_prepositions/the_book_is_on_the_table.mp3',
    },
    {
      'question': 'When will you arrive?',
      'answer': 'I will arrive at 5 PM.',
      'translation': 'متى ستصل؟',
      'soundQuestion': 'sounds/pronouns_prepositions/when_will_you_arrive.mp3',
      'soundAnswer': 'sounds/pronouns_prepositions/i_will_arrive_at_5_pm.mp3',
    },
    {
      'question': 'Why are you late?',
      'answer': 'I am late because of traffic.',
      'translation': 'لماذا تأخرت؟',
      'soundQuestion': 'sounds/pronouns_prepositions/why_are_you_late.mp3',
      'soundAnswer':
          'sounds/pronouns_prepositions/i_am_late_because_of_traffic.mp3',
    },
    {
      'question': 'Which is your favorite color?',
      'answer': 'My favorite color is blue.',
      'translation': 'ما هو لونك المفضل؟',
      'soundQuestion':
          'sounds/pronouns_prepositions/which_is_your_favorite_color.mp3',
      'soundAnswer':
          'sounds/pronouns_prepositions/my_favorite_color_is_blue.mp3',
    },
    {
      'question': 'How old are you?',
      'answer': 'I am 25 years old.',
      'translation': 'كم عمرك؟',
      'soundQuestion': 'sounds/pronouns_prepositions/how_old_are_you.mp3',
      'soundAnswer': 'sounds/pronouns_prepositions/i_am_25_years_old.mp3',
    },
  ];

  PronounsPrepositionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pronouns & Prepositions'),
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
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
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
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
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
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
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

  void _playSound(String soundPath) async {
    final audioPlayer = AudioPlayer();
    try {
      await audioPlayer.play(AssetSource(soundPath));
    } catch (e) {
      print("Error playing sound: $e");
    }
  }
}
