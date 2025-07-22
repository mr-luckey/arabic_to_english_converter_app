import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_tts/flutter_tts.dart';

class EverydayConversationsScreen extends StatelessWidget {
  final List<Map<String, String>> conversations = [
    {
      'question': 'How are you?',
      'answer': 'I am good, thank you!',
      'translation': 'كيف حالك؟',
      'soundQuestion': 'sounds/everyday_conversations/how_are_you.mp3',
      'soundAnswer': 'sounds/everyday_conversations/i_am_good_thank_you.mp3',
    },
    {
      'question': 'What are you doing?',
      'answer': 'I am studying.',
      'translation': 'ماذا تفعل؟',
      'soundQuestion': 'sounds/everyday_conversations/what_are_you_doing.mp3',
      'soundAnswer': 'sounds/everyday_conversations/i_am_studying.mp3',
    },
    {
      'question': 'Do you like coffee?',
      'answer': 'Yes, I love coffee!',
      'translation': 'هل تحب القهوة؟',
      'soundQuestion': 'sounds/everyday_conversations/do_you_like_coffee.mp3',
      'soundAnswer': 'sounds/everyday_conversations/yes_i_love_coffee.mp3',
    },
    {
      'question': 'What time is it?',
      'answer': 'It is 3 PM.',
      'translation': 'كم الساعة؟',
      'soundQuestion': 'sounds/everyday_conversations/what_time_is_it.mp3',
      'soundAnswer': 'sounds/everyday_conversations/it_is_3_pm.mp3',
    },
    {
      'question': 'Where are you going?',
      'answer': 'I am going to the market.',
      'translation': 'أين تذهب؟',
      'soundQuestion': 'sounds/everyday_conversations/where_are_you_going.mp3',
      'soundAnswer':
          'sounds/everyday_conversations/i_am_going_to_the_market.mp3',
    },
    {
      'question': 'What is your favorite food?',
      'answer': 'I like pizza.',
      'translation': 'ما هو طعامك المفضل؟',
      'soundQuestion':
          'sounds/everyday_conversations/what_is_your_favorite_food.mp3',
      'soundAnswer': 'sounds/everyday_conversations/i_like_pizza.mp3',
    },
    {
      'question': 'How was your day?',
      'answer': 'It was great, thanks!',
      'translation': 'كيف كان يومك؟',
      'soundQuestion': 'sounds/everyday_conversations/how_was_your_day.mp3',
      'soundAnswer': 'sounds/everyday_conversations/it_was_great_thanks.mp3',
    },
    {
      'question': 'Can you recommend a movie?',
      'answer': 'Yes, I recommend Inception.',
      'translation': 'هل يمكنك أن توصي بفيلم؟',
      'soundQuestion':
          'sounds/everyday_conversations/can_you_recommend_a_movie.mp3',
      'soundAnswer': 'sounds/everyday_conversations/i_recommend_inception.mp3',
    },
    {
      'question': 'What do you do in your free time?',
      'answer': 'I like to read books.',
      'translation': 'ماذا تفعل في وقت فراغك؟',
      'soundQuestion':
          'sounds/everyday_conversations/what_do_you_do_in_your_free_time.mp3',
      'soundAnswer': 'sounds/everyday_conversations/i_like_to_read_books.mp3',
    },
    {
      'question': 'Where did you go on vacation?',
      'answer': 'I went to Paris.',
      'translation': 'أين ذهبت في عطلتك؟',
      'soundQuestion':
          'sounds/everyday_conversations/where_did_you_go_on_vacation.mp3',
      'soundAnswer': 'sounds/everyday_conversations/i_went_to_paris.mp3',
    },
  ];

  EverydayConversationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Everyday Conversations'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: conversations.length,
          itemBuilder: (context, index) {
            final conversation = conversations[index];
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
                            'Q: ${conversation['question']}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.volume_up, color: Colors.blue),
                          onPressed: () {
                            FlutterTts().speak(conversation['question']!);
                            // _playSound(conversation['soundQuestion']!);
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'A: ${conversation['answer']}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.volume_up, color: Colors.blue),
                          onPressed: () {
                            FlutterTts().speak(conversation['answer']!);

                            // _playSound(conversation['soundAnswer']!);
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Translation: ${conversation['translation']}',
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
