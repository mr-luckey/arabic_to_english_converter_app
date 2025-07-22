import 'package:audioplayers/audioplayers.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class BasicVocabularyScreen extends StatelessWidget {
  BasicVocabularyScreen({super.key});

  // Sample vocabulary with 5 words per letter (A-Z)
  final Map<String, List<Map<String, String>>> vocabulary = {
    'A': [
      {'word': 'Apple', 'arabic': 'تفاحة', 'audio': 'assets/sounds/apple.mp3'},
      {'word': 'Ant', 'arabic': 'نملة', 'audio': 'assets/sounds/ant.mp3'},
      {
        'word': 'Airplane',
        'arabic': 'طائرة',
        'audio': 'assets/sounds/airplane.mp3'
      },
      {'word': 'Arm', 'arabic': 'ذراع', 'audio': 'assets/sounds/arm.mp3'},
      {'word': 'Arrow', 'arabic': 'سهم', 'audio': 'assets/sounds/arrow.mp3'},
    ],
    'B': [
      {'word': 'Ball', 'arabic': 'كرة', 'audio': 'assets/sounds/ball.mp3'},
      {'word': 'Banana', 'arabic': 'موزة', 'audio': 'assets/sounds/banana.mp3'},
      {'word': 'Bird', 'arabic': 'عصفور', 'audio': 'assets/sounds/bird.mp3'},
      {'word': 'Book', 'arabic': 'كتاب', 'audio': 'assets/sounds/book.mp3'},
      {'word': 'Bed', 'arabic': 'سرير', 'audio': 'assets/sounds/bed.mp3'},
    ],
    'C': [
      {'word': 'Cat', 'arabic': 'قطة', 'audio': 'assets/sounds/cat.mp3'},
      {'word': 'Car', 'arabic': 'سيارة', 'audio': 'assets/sounds/car.mp3'},
      {'word': 'Cup', 'arabic': 'كوب', 'audio': 'assets/sounds/cup.mp3'},
      {'word': 'Chair', 'arabic': 'كرسي', 'audio': 'assets/sounds/chair.mp3'},
      {'word': 'Cloud', 'arabic': 'غيمة', 'audio': 'assets/sounds/cloud.mp3'},
    ],
    'D': [
      {'word': 'Dog', 'arabic': 'كلب', 'audio': 'assets/sounds/dog.mp3'},
      {'word': 'Duck', 'arabic': 'بطة', 'audio': 'assets/sounds/duck.mp3'},
      {'word': 'Door', 'arabic': 'باب', 'audio': 'assets/sounds/door.mp3'},
      {'word': 'Desk', 'arabic': 'مكتب', 'audio': 'assets/sounds/desk.mp3'},
      {'word': 'Drum', 'arabic': 'طبل', 'audio': 'assets/sounds/drum.mp3'},
    ],
    'E': [
      {
        'word': 'Elephant',
        'arabic': 'فيل',
        'audio': 'assets/sounds/elephant.mp3'
      },
      {'word': 'Egg', 'arabic': 'بيضة', 'audio': 'assets/sounds/egg.mp3'},
      {'word': 'Ear', 'arabic': 'أذن', 'audio': 'assets/sounds/ear.mp3'},
      {'word': 'Engine', 'arabic': 'محرك', 'audio': 'assets/sounds/engine.mp3'},
      {'word': 'Eye', 'arabic': 'عين', 'audio': 'assets/sounds/eye.mp3'},
    ],
    'F': [
      {'word': 'Fish', 'arabic': 'سمكة', 'audio': 'assets/sounds/fish.mp3'},
      {'word': 'Frog', 'arabic': 'ضفدع', 'audio': 'assets/sounds/frog.mp3'},
      {'word': 'Flag', 'arabic': 'علم', 'audio': 'assets/sounds/flag.mp3'},
      {'word': 'Flower', 'arabic': 'زهرة', 'audio': 'assets/sounds/flower.mp3'},
      {'word': 'Fire', 'arabic': 'نار', 'audio': 'assets/sounds/fire.mp3'},
    ],
    'G': [
      {'word': 'Goat', 'arabic': 'ماعز', 'audio': 'assets/sounds/goat.mp3'},
      {'word': 'Girl', 'arabic': 'فتاة', 'audio': 'assets/sounds/girl.mp3'},
      {'word': 'Gift', 'arabic': 'هدية', 'audio': 'assets/sounds/gift.mp3'},
      {'word': 'Glass', 'arabic': 'زجاج', 'audio': 'assets/sounds/glass.mp3'},
      {'word': 'Grass', 'arabic': 'عشب', 'audio': 'assets/sounds/grass.mp3'},
    ],
    'H': [
      {'word': 'Hat', 'arabic': 'قبعة', 'audio': 'assets/sounds/hat.mp3'},
      {'word': 'Horse', 'arabic': 'حصان', 'audio': 'assets/sounds/horse.mp3'},
      {'word': 'House', 'arabic': 'بيت', 'audio': 'assets/sounds/house.mp3'},
      {'word': 'Hand', 'arabic': 'يد', 'audio': 'assets/sounds/hand.mp3'},
      {'word': 'Heart', 'arabic': 'قلب', 'audio': 'assets/sounds/heart.mp3'},
    ],
    'I': [
      {'word': 'Ice', 'arabic': 'ثلج', 'audio': 'assets/sounds/ice.mp3'},
      {'word': 'Ink', 'arabic': 'حبر', 'audio': 'assets/sounds/ink.mp3'},
      {
        'word': 'Island',
        'arabic': 'جزيرة',
        'audio': 'assets/sounds/island.mp3'
      },
      {'word': 'Iron', 'arabic': 'حديد', 'audio': 'assets/sounds/iron.mp3'},
      {'word': 'Insect', 'arabic': 'حشرة', 'audio': 'assets/sounds/insect.mp3'},
    ],
    'J': [
      {'word': 'Juice', 'arabic': 'عصير', 'audio': 'assets/sounds/juice.mp3'},
      {'word': 'Jam', 'arabic': 'مربى', 'audio': 'assets/sounds/jam.mp3'},
      {
        'word': 'Jaguar',
        'arabic': 'يجوار',
        'audio': 'assets/sounds/jaguar.mp3'
      },
      {
        'word': 'Jacket',
        'arabic': 'جاكيت',
        'audio': 'assets/sounds/jacket.mp3'
      },
      {'word': 'Jump', 'arabic': 'يقفز', 'audio': 'assets/sounds/jump.mp3'},
    ],
    'K': [
      {
        'word': 'Kite',
        'arabic': 'طائرة ورقية',
        'audio': 'assets/sounds/kite.mp3'
      },
      {'word': 'Key', 'arabic': 'مفتاح', 'audio': 'assets/sounds/key.mp3'},
      {'word': 'King', 'arabic': 'ملك', 'audio': 'assets/sounds/king.mp3'},
      {
        'word': 'Kangaroo',
        'arabic': 'كنغر',
        'audio': 'assets/sounds/kangaroo.mp3'
      },
      {'word': 'Knee', 'arabic': 'ركبة', 'audio': 'assets/sounds/knee.mp3'},
    ],
    'L': [
      {'word': 'Lion', 'arabic': 'أسد', 'audio': 'assets/sounds/lion.mp3'},
      {'word': 'Lamp', 'arabic': 'مصباح', 'audio': 'assets/sounds/lamp.mp3'},
      {'word': 'Leaf', 'arabic': 'ورقة', 'audio': 'assets/sounds/leaf.mp3'},
      {'word': 'Lake', 'arabic': 'بحيرة', 'audio': 'assets/sounds/lake.mp3'},
      {'word': 'Lemon', 'arabic': 'ليمون', 'audio': 'assets/sounds/lemon.mp3'},
    ],
    'M': [
      {'word': 'Monkey', 'arabic': 'قرد', 'audio': 'assets/sounds/monkey.mp3'},
      {'word': 'Mouse', 'arabic': 'فأر', 'audio': 'assets/sounds/mouse.mp3'},
      {'word': 'Mango', 'arabic': 'مانجو', 'audio': 'assets/sounds/mango.mp3'},
      {
        'word': 'Mountain',
        'arabic': 'جبل',
        'audio': 'assets/sounds/mountain.mp3'
      },
      {'word': 'Milk', 'arabic': 'حليب', 'audio': 'assets/sounds/milk.mp3'},
    ],
    'N': [
      {'word': 'Nurse', 'arabic': 'مربية', 'audio': 'assets/sounds/nurse.mp3'},
      {'word': 'Nest', 'arabic': 'عش', 'audio': 'assets/sounds/nest.mp3'},
      {
        'word': 'Notebook',
        'arabic': 'دفتر',
        'audio': 'assets/sounds/notebook.mp3'
      },
      {'word': 'Needle', 'arabic': 'إبرة', 'audio': 'assets/sounds/needle.mp3'},
      {'word': 'Nail', 'arabic': 'ظفر', 'audio': 'assets/sounds/nail.mp3'},
    ],
    'O': [
      {
        'word': 'Orange',
        'arabic': 'برتقالة',
        'audio': 'assets/sounds/orange.mp3'
      },
      {'word': 'Owl', 'arabic': 'بومة', 'audio': 'assets/sounds/owl.mp3'},
      {
        'word': 'Octopus',
        'arabic': 'أخطبوط',
        'audio': 'assets/sounds/octopus.mp3'
      },
      {'word': 'Onion', 'arabic': 'بصل', 'audio': 'assets/sounds/onion.mp3'},
      {'word': 'Oven', 'arabic': 'فرن', 'audio': 'assets/sounds/oven.mp3'},
    ],
    'P': [
      {'word': 'Panda', 'arabic': 'باندا', 'audio': 'assets/sounds/panda.mp3'},
      {
        'word': 'Pencil',
        'arabic': 'قلم رصاص',
        'audio': 'assets/sounds/pencil.mp3'
      },
      {
        'word': 'Pineapple',
        'arabic': 'أناناس',
        'audio': 'assets/sounds/pineapple.mp3'
      },
      {'word': 'Plane', 'arabic': 'طائرة', 'audio': 'assets/sounds/plane.mp3'},
      {
        'word': 'Pumpkin',
        'arabic': 'يقطين',
        'audio': 'assets/sounds/pumpkin.mp3'
      },
    ],
    'Q': [
      {'word': 'Queen', 'arabic': 'ملكة', 'audio': 'assets/sounds/queen.mp3'},
      {'word': 'Quilt', 'arabic': 'لحاف', 'audio': 'assets/sounds/quilt.mp3'},
      {
        'word': 'Quokka',
        'arabic': 'كوككا',
        'audio': 'assets/sounds/quokka.mp3'
      },
      {
        'word': 'Quokka',
        'arabic': 'كوككا',
        'audio': 'assets/sounds/quokka.mp3'
      },
      {'word': 'Quiz', 'arabic': 'اختبار', 'audio': 'assets/sounds/quiz.mp3'},
    ],
    'R': [
      {'word': 'Rabbit', 'arabic': 'أرنب', 'audio': 'assets/sounds/rabbit.mp3'},
      {'word': 'Rat', 'arabic': 'جرذ', 'audio': 'assets/sounds/rat.mp3'},
      {'word': 'Ring', 'arabic': 'خاتم', 'audio': 'assets/sounds/ring.mp3'},
      {
        'word': 'Rocket',
        'arabic': 'صاروخ',
        'audio': 'assets/sounds/rocket.mp3'
      },
      {'word': 'Rose', 'arabic': 'وردة', 'audio': 'assets/sounds/rose.mp3'},
    ],
    'S': [
      {'word': 'Sun', 'arabic': 'شمس', 'audio': 'assets/sounds/sun.mp3'},
      {'word': 'Star', 'arabic': 'نجمة', 'audio': 'assets/sounds/star.mp3'},
      {'word': 'Snake', 'arabic': 'ثعبان', 'audio': 'assets/sounds/snake.mp3'},
      {'word': 'Soup', 'arabic': 'حساء', 'audio': 'assets/sounds/soup.mp3'},
      {'word': 'Sand', 'arabic': 'رمل', 'audio': 'assets/sounds/sand.mp3'},
    ],
    'T': [
      {'word': 'Tiger', 'arabic': 'نمر', 'audio': 'assets/sounds/tiger.mp3'},
      {'word': 'Tree', 'arabic': 'شجرة', 'audio': 'assets/sounds/tree.mp3'},
      {'word': 'Train', 'arabic': 'قطار', 'audio': 'assets/sounds/train.mp3'},
      {'word': 'Table', 'arabic': 'طاولة', 'audio': 'assets/sounds/table.mp3'},
      {
        'word': 'Television',
        'arabic': 'تلفاز',
        'audio': 'assets/sounds/television.mp3'
      },
    ],
    'U': [
      {
        'word': 'Umbrella',
        'arabic': 'مظلة',
        'audio': 'assets/sounds/umbrella.mp3'
      },
      {
        'word': 'Unicorn',
        'arabic': 'وحيد القرن',
        'audio': 'assets/sounds/unicorn.mp3'
      },
      {
        'word': 'Uniform',
        'arabic': 'زي موحد',
        'audio': 'assets/sounds/uniform.mp3'
      },
      {'word': 'Urn', 'arabic': 'جرة', 'audio': 'assets/sounds/urn.mp3'},
      {'word': 'USB', 'arabic': 'يو إس بي', 'audio': 'assets/sounds/usb.mp3'},
    ],
    'V': [
      {'word': 'Violin', 'arabic': 'كمان', 'audio': 'assets/sounds/violin.mp3'},
      {'word': 'Vase', 'arabic': 'مزهرية', 'audio': 'assets/sounds/vase.mp3'},
      {'word': 'Van', 'arabic': 'فان', 'audio': 'assets/sounds/van.mp3'},
      {
        'word': 'Vegetable',
        'arabic': 'خضار',
        'audio': 'assets/sounds/vegetable.mp3'
      },
      {
        'word': 'Vulture',
        'arabic': 'نسر',
        'audio': 'assets/sounds/vulture.mp3'
      },
    ],
    'W': [
      {'word': 'Water', 'arabic': 'ماء', 'audio': 'assets/sounds/water.mp3'},
      {'word': 'Wind', 'arabic': 'ريح', 'audio': 'assets/sounds/wind.mp3'},
      {'word': 'Wolf', 'arabic': 'ذئب', 'audio': 'assets/sounds/wolf.mp3'},
      {
        'word': 'Window',
        'arabic': 'نافذة',
        'audio': 'assets/sounds/window.mp3'
      },
      {'word': 'Watch', 'arabic': 'ساعة', 'audio': 'assets/sounds/watch.mp3'},
    ],
    'X': [
      {
        'word': 'Xylophone',
        'arabic': 'زيلوفون',
        'audio': 'assets/sounds/xylophone.mp3'
      },
      {
        'word': 'X-ray',
        'arabic': 'أشعة سينية',
        'audio': 'assets/sounds/xray.mp3'
      },
      {'word': 'Xenon', 'arabic': 'زينون', 'audio': 'assets/sounds/xenon.mp3'},
      {'word': 'Xerox', 'arabic': 'زيروكس', 'audio': 'assets/sounds/xerox.mp3'},
      {
        'word': 'Xerophyte',
        'arabic': 'نبات صحراوي',
        'audio': 'assets/sounds/xerophyte.mp3'
      },
    ],
    'Y': [
      {'word': 'Yacht', 'arabic': 'يخت', 'audio': 'assets/sounds/yacht.mp3'},
      {
        'word': 'Yogurt',
        'arabic': 'زبادي',
        'audio': 'assets/sounds/yogurt.mp3'
      },
      {'word': 'Yellow', 'arabic': 'أصفر', 'audio': 'assets/sounds/yellow.mp3'},
      {'word': 'Yarn', 'arabic': 'خيط', 'audio': 'assets/sounds/yarn.mp3'},
      {'word': 'Yolk', 'arabic': 'صفار', 'audio': 'assets/sounds/yolk.mp3'},
    ],
    'Z': [
      {
        'word': 'Zebra',
        'arabic': 'حمار الوحش',
        'audio': 'assets/sounds/zebra.mp3'
      },
      {
        'word': 'Zoo',
        'arabic': 'حديقة الحيوان',
        'audio': 'assets/sounds/zoo.mp3'
      },
      {'word': 'Zipper', 'arabic': 'سحاب', 'audio': 'assets/sounds/zipper.mp3'},
      {'word': 'Zenith', 'arabic': 'ذروة', 'audio': 'assets/sounds/zenith.mp3'},
      {'word': 'Zero', 'arabic': 'صفر', 'audio': 'assets/sounds/zero.mp3'},
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Vocabulary').tr(),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: vocabulary.entries.map((entry) {
          return VocabularySection(
            letter: entry.key,
            words: entry.value,
          );
        }).toList(),
      ),
    );
  }
}

class VocabularySection extends StatelessWidget {
  final String letter;
  final List<Map<String, String>> words;

  const VocabularySection({
    super.key,
    required this.letter,
    required this.words,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Text(
            letter,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        ...words.map((wordData) {
          return VocabularyItem(wordData: wordData);
        }),
      ],
    );
  }
}

class VocabularyItem extends StatelessWidget {
  final Map<String, String> wordData;

  const VocabularyItem({super.key, required this.wordData});

  @override
  Widget build(BuildContext context) {
    // final audioPlayer = AudioPlayer();

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(wordData['word']!),
        subtitle: Text(wordData['arabic']!),
        trailing: IconButton(
          icon: const Icon(Icons.volume_up, size: 32, color: Colors.blue),
          onPressed: () {
            FlutterTts().speak(wordData['word']!);
            // await audioPlayer.play(AssetSource(wordData['word']!)); // Use AssetSource here
          },
        ),
      ),
    );
  }
}
