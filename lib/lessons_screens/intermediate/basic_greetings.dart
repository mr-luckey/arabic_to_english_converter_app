import 'package:audioplayers/audioplayers.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class BasicGreetingsScreen extends StatelessWidget {
  BasicGreetingsScreen({super.key});

  final List<Map<String, String>> greetings = [
    {
      'english': 'Good Morning',
      'arabic': 'صباح الخير',
      'audio': 'assets/sounds/good_morning.mp3',
    },
    {
      'english': 'Good Evening',
      'arabic': 'مساء الخير',
      'audio': 'assets/sounds/good_evening.mp3',
    },
    {
      'english': 'How are you?',
      'arabic': 'كيف حالك؟',
      'audio': 'assets/sounds/how_are_you.mp3',
    },
    {
      'english': 'Thank you',
      'arabic': 'شكرا',
      'audio': 'assets/sounds/thank_you.mp3',
    },
    {
      'english': 'Goodbye',
      'arabic': 'مع السلامة',
      'audio': 'assets/sounds/goodbye.mp3',
    },
    {
      'english': 'Good Night',
      'arabic': 'تصبح على خير',
      'audio': 'assets/sounds/good_night.mp3',
    },
    {
      'english': 'Nice to meet you',
      'arabic': 'تشرفت بمقابلتك',
      'audio': 'assets/sounds/nice_to_meet_you.mp3',
    },
    {
      'english': 'Please',
      'arabic': 'من فضلك',
      'audio': 'assets/sounds/please.mp3',
    },
    {
      'english': 'Excuse me',
      'arabic': 'عفواً',
      'audio': 'assets/sounds/excuse_me.mp3',
    },
    {
      'english': 'I’m sorry',
      'arabic': 'أنا آسف',
      'audio': 'assets/sounds/im_sorry.mp3',
    },
    {
      'english': 'What’s your name?',
      'arabic': 'ما اسمك؟',
      'audio': 'assets/sounds/whats_your_name.mp3',
    },
    {
      'english': 'My name is...',
      'arabic': 'اسمي ...',
      'audio': 'assets/sounds/my_name_is.mp3',
    },
    {
      'english': 'Where are you from?',
      'arabic': 'من أين أنت؟',
      'audio': 'assets/sounds/where_are_you_from.mp3',
    },
    {
      'english': 'How old are you?',
      'arabic': 'كم عمرك؟',
      'audio': 'assets/sounds/how_old_are_you.mp3',
    },
    {
      'english': 'Yes',
      'arabic': 'نعم',
      'audio': 'assets/sounds/yes.mp3',
    },
    {
      'english': 'No',
      'arabic': 'لا',
      'audio': 'assets/sounds/no.mp3',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Greetings').tr(),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: greetings.length,
        itemBuilder: (context, index) {
          final greeting = greetings[index];
          return GreetingCard(
            english: greeting['english']!,
            arabic: greeting['arabic']!,
            // audioPath: greeting['audio']!,
          );
        },
      ),
    );
  }
}

class GreetingCard extends StatefulWidget {
  final String english;
  final String arabic;
  // final String audioPath;

  const GreetingCard({
    super.key,
    required this.english,
    required this.arabic,
    // required this.audioPath,
  });

  @override
  _GreetingCardState createState() => _GreetingCardState();
}

class _GreetingCardState extends State<GreetingCard> {
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
              // Wrap the text in an Expanded widget
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.english,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.arabic,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.volume_up, size: 32, color: Colors.blue),
              onPressed: _playAudio, // Play the greeting audio
            ),
          ],
        ),
      ),
    );
  }
}
