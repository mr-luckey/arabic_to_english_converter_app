import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_tts/flutter_tts.dart';

class ColorsScreen extends StatefulWidget {
  ColorsScreen({super.key});

  @override
  _ColorsScreenState createState() => _ColorsScreenState();
}

class _ColorsScreenState extends State<ColorsScreen> {
  final List<Map<String, String>> colors = [
    {
      'name': 'Red',
      'code': Colors.red.value.toString(),
      'sound': 'sounds/colors/red.mp3'
    },
    {
      'name': 'Green',
      'code': Colors.green.value.toString(),
      'sound': 'sounds/colors/green.mp3'
    },
    {
      'name': 'Blue',
      'code': Colors.blue.value.toString(),
      'sound': 'sounds/colors/blue.mp3'
    },
    {
      'name': 'Yellow',
      'code': Colors.yellow.value.toString(),
      'sound': 'sounds/colors/yellow.mp3'
    },
    {
      'name': 'Orange',
      'code': Colors.orange.value.toString(),
      'sound': 'sounds/colors/orange.mp3'
    },
    {
      'name': 'Purple',
      'code': Colors.purple.value.toString(),
      'sound': 'sounds/colors/purple.mp3'
    },
  ];

  late AudioPlayer _audioPlayer; // AudioPlayer to play color sounds

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer(); // Initialize the audio player
  }

  @override
  void dispose() {
    _audioPlayer.dispose(); // Dispose the audio player when not needed
    super.dispose();
  }

  // void _playSound(String soundPath) async {
  //   try {
  //     await _audioPlayer.play(AssetSource(soundPath));
  //   } catch (e) {
  //     print("Error playing sound: $e");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn Colors'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Two cards per row
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: colors.length,
          itemBuilder: (context, index) {
            final colorInfo = colors[index];
            final colorName = colorInfo['name']!;
            final colorCode = Color(int.parse(colorInfo['code']!));
            // final soundPath = colorInfo['sound']!;

            return GestureDetector(
              onTap: () {
                FlutterTts().speak(colorName);
                // Play the sound when the color card is tapped
                // _playSound(soundPath);
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
                color: colorCode,
                child: Stack(
                  children: [
                    // Color name in the center of the card
                    Center(
                      child: Text(
                        colorName,
                        style: const TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // Speaker icon at the bottom-right corner
                    Positioned(
                      bottom: 8,
                      right: 8,
                      child: Icon(
                        Icons.volume_up,
                        size: 32,
                        color: Colors.white.withOpacity(0.8),
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
}
