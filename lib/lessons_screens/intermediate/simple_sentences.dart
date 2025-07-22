import 'package:audioplayers/audioplayers.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class SimpleSentencesScreen extends StatelessWidget {
  SimpleSentencesScreen({super.key});

  final List<Map<String, String>> sentences = [
    {
      'english': 'I like to read books.',
      'arabic': 'أحب قراءة الكتب.',
      'audio': 'assets/sounds/i_like_to_read_books.mp3',
    },
    {
      'english': 'The weather is nice today.',
      'arabic': 'الطقس لطيف اليوم.',
      'audio': 'assets/sounds/the_weather_is_nice_today.mp3',
    },
    {
      'english': 'She is my best friend.',
      'arabic': 'هي أفضل صديقة لي.',
      'audio': 'assets/sounds/she_is_my_best_friend.mp3',
    },
    {
      'english': 'I want to learn Arabic.',
      'arabic': 'أريد تعلم العربية.',
      'audio': 'assets/sounds/i_want_to_learn_arabic.mp3',
    },
    {
      'english': 'What time is it?',
      'arabic': 'كم الساعة؟',
      'audio': 'assets/sounds/what_time_is_it.mp3',
    },
    {
      'english': 'Can you help me?',
      'arabic': 'هل يمكنك مساعدتي؟',
      'audio': 'assets/sounds/can_you_help_me.mp3',
    },
    {
      'english': 'Where is the bathroom?',
      'arabic': 'أين الحمام؟',
      'audio': 'assets/sounds/where_is_the_bathroom.mp3',
    },
    {
      'english': 'I love to travel.',
      'arabic': 'أحب السفر.',
      'audio': 'assets/sounds/i_love_to_travel.mp3',
    },
    {
      'english': 'What is your favorite color?',
      'arabic': 'ما هو لونك المفضل؟',
      'audio': 'assets/sounds/what_is_your_favorite_color.mp3',
    },
    {
      'english': 'I am learning English.',
      'arabic': 'أنا أتعلم الإنجليزية.',
      'audio': 'assets/sounds/i_am_learning_english.mp3',
    },
    {
      'english': 'How was your day?',
      'arabic': 'كيف كان يومك؟',
      'audio': 'assets/sounds/how_was_your_day.mp3',
    },
    {
      'english': 'Where are you going?',
      'arabic': 'إلى أين أنت ذاهب؟',
      'audio': 'assets/sounds/where_are_you_going.mp3',
    },
    {
      'english': 'I am hungry.',
      'arabic': 'أنا جائع.',
      'audio': 'assets/sounds/i_am_hungry.mp3',
    },
    {
      'english': 'Let’s go to the park.',
      'arabic': 'هيا نذهب إلى الحديقة.',
      'audio': 'assets/sounds/lets_go_to_the_park.mp3',
    },
    {
      'english': 'I am feeling tired.',
      'arabic': 'أشعر بالتعب.',
      'audio': 'assets/sounds/i_am_feeling_tired.mp3',
    },
    {
      'english': 'This is my house.',
      'arabic': 'هذا منزلي.',
      'audio': 'assets/sounds/this_is_my_house.mp3',
    },
    {
      'english': 'I need some water.',
      'arabic': 'أحتاج إلى بعض الماء.',
      'audio': 'assets/sounds/i_need_some_water.mp3',
    },
    {
      'english': 'I will call you later.',
      'arabic': 'سأتصل بك لاحقًا.',
      'audio': 'assets/sounds/i_will_call_you_later.mp3',
    },
    {
      'english': 'My phone is not working.',
      'arabic': 'هاتفي لا يعمل.',
      'audio': 'assets/sounds/my_phone_is_not_working.mp3',
    },
    {
      'english': 'The movie was great.',
      'arabic': 'الفيلم كان رائعاً.',
      'audio': 'assets/sounds/the_movie_was_great.mp3',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Sentences').tr(),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: sentences.length,
        itemBuilder: (context, index) {
          final sentence = sentences[index];
          return SentenceCard(
            english: sentence['english']!,
            arabic: sentence['arabic']!,
            // audioPath: sentence['audio']!,
          );
        },
      ),
    );
  }
}

class SentenceCard extends StatefulWidget {
  final String english;
  final String arabic;
  // final String audioPath;

  const SentenceCard({
    super.key,
    required this.english,
    required this.arabic,
    // required this.audioPath,
  });

  @override
  _SentenceCardState createState() => _SentenceCardState();
}

class _SentenceCardState extends State<SentenceCard> {
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer(); // Initialize audio player
  }

  @override
  void dispose() {
    _audioPlayer
        .dispose(); // Dispose the audio player when the widget is destroyed
    super.dispose();
  }

  void _playAudio() async {
    // print("Playing audio from: ${widget.audioPath}");
    try {
      FlutterTts().speak(widget.english);
      // await _audioPlayer.play(AssetSource(widget.audioPath)); // Play audio from assets
    } catch (e) {
      print("Error playing audio: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.english,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.arabic,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.volume_up, size: 32, color: Colors.blue),
              onPressed: _playAudio, // Play the sentence audio
            ),
          ],
        ),
      ),
    );
  }
}
