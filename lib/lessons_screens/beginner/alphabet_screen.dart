import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class AlphabetScreen extends StatefulWidget {
  AlphabetScreen({super.key});

  @override
  _AlphabetScreenState createState() => _AlphabetScreenState();
}

class _AlphabetScreenState extends State<AlphabetScreen> {
  final List<Map<String, String>> alphabets = List.generate(
    26,
    (index) => {
      'letter': String.fromCharCode(65 + index),
      // 'sound':FlutterTts().speak(String.fromCharCode(65 + index)) ,// Generates A-Z in uppercase
      // 'sound': 'sounds/letters/${String.fromCharCode(65 + index)}.mp3'
    },
  );

  late AudioPlayer _audioPlayer; // AudioPlayer to play the letter sounds

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
        title: const Text('Alphabet & Phonics'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // Three cards per row
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: alphabets.length,
          itemBuilder: (context, index) {
            final alphabet = alphabets[index]['letter']!;

            final soundPath = alphabets[index]['letter']!;

            return GestureDetector(
              onTap: () {
                FlutterTts().speak(soundPath);
                // Play the sound when the card is tapped
                // _playSound(soundPath);
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
                color: Colors.blueAccent,
                child: Stack(
                  children: [
                    // Letter at the center of the card
                    Center(
                      child: Text(
                        alphabet,
                        style: const TextStyle(
                          fontSize: 48,
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
