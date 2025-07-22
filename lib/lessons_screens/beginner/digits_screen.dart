import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_tts/flutter_tts.dart';

class DigitsScreen extends StatefulWidget {
  DigitsScreen({super.key});

  @override
  _DigitsScreenState createState() => _DigitsScreenState();
}

class _DigitsScreenState extends State<DigitsScreen> {
  final List<Map<String, String>> digits = List.generate(
    10,
    (index) => {
      'digit': '${index + 1}', // Generates digits 1-10
      'word': [
        'One',
        'Two',
        'Three',
        'Four',
        'Five',
        'Six',
        'Seven',
        'Eight',
        'Nine',
        'Ten'
      ][index], // Word representation
      'sound': 'sounds/digits/${index + 1}.mp3' // Adjust path as necessary
    },
  );

  late AudioPlayer _audioPlayer; // Initialize AudioPlayer to play digit sounds

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
        title: const Text('Learn Digits'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // Three cards per row
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: digits.length,
          itemBuilder: (context, index) {
            final digit = digits[index]['digit']!;
            // final soundPath = digits[index]['sound']!;

            return GestureDetector(
              onTap: () {
                FlutterTts().speak(digit);
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
                    // Digit at the center of the card
                    Center(
                      child: Text(
                        digit,
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
