import '../navigation_screens/games_screen.dart';

List<Question> getAnimalQuestions() {
  return [
    Question(
      soundPath: 'sounds/animals/cat.mp3',
      correctAnswerIndex: 0,
      options: ['assets/images/gamified_xp/cat.jpg', 'assets/images/gamified_xp/dog.jpg'],
    ),
    Question(
      soundPath: 'sounds/animals/dog.mp3',
      correctAnswerIndex: 1,
      options: ['assets/images/gamified_xp/cow.jpg', 'assets/images/gamified_xp/dog.jpg'],
    ),
    Question(
      soundPath: 'sounds/animals/cow.mp3',
      correctAnswerIndex: 0,
      options: ['assets/images/gamified_xp/cow.jpg', 'assets/images/gamified_xp/sheep.jpg'],
    ),
    Question(
      soundPath: 'sounds/animals/sheep.mp3',
      correctAnswerIndex: 1,
      options: ['assets/images/gamified_xp/goat.jpg', 'assets/images/gamified_xp/sheep.jpg'],
    ),
    Question(
      soundPath: 'sounds/animals/lion.mp3',
      correctAnswerIndex: 0,
      options: ['assets/images/gamified_xp/lion.jpg', 'assets/images/gamified_xp/tiger.jpg'],
    ),
    Question(
      soundPath: 'sounds/animals/tiger.mp3',
      correctAnswerIndex: 1,
      options: ['assets/images/gamified_xp/leopard.jpg', 'assets/images/gamified_xp/tiger.jpg'],
    ),
    Question(
      soundPath: 'sounds/animals/elephant.mp3',
      correctAnswerIndex: 0,
      options: ['assets/images/gamified_xp/elephant.jpg', 'assets/images/gamified_xp/rhino.jpg'],
    ),
    Question(
      soundPath: 'sounds/animals/rhino.mp3',
      correctAnswerIndex: 1,
      options: ['assets/images/gamified_xp/hippo.jpg', 'assets/images/gamified_xp/rhino.jpg'],
    ),
    Question(
      soundPath: 'sounds/animals/monkey.mp3',
      correctAnswerIndex: 0,
      options: ['assets/images/gamified_xp/monkey.jpg', 'assets/images/gamified_xp/bear.jpg'],
    ),
    Question(
      soundPath: 'sounds/animals/bird.mp3',
      correctAnswerIndex: 1,
      options: ['assets/images/gamified_xp/snake.jpg', 'assets/images/gamified_xp/bird.jpg'],
    ),
  ];
}

List<Question> getColorQuestions() {
  return [
    Question(
      soundPath: 'sounds/colors/red.mp3',
      correctAnswerIndex: 0,
      options: ['assets/images/gamified_xp/red.jpg', 'assets/images/gamified_xp/blue.jpg'],
    ),
    Question(
      soundPath: 'sounds/colors/blue.mp3',
      correctAnswerIndex: 1,
      options: ['assets/images/gamified_xp/green.jpg', 'assets/images/gamified_xp/blue.jpg'],
    ),
    Question(
      soundPath: 'sounds/colors/green.mp3',
      correctAnswerIndex: 0,
      options: ['assets/images/gamified_xp/green.jpg', 'assets/images/gamified_xp/yellow.jpg'],
    ),
    Question(
      soundPath: 'sounds/colors/yellow.mp3',
      correctAnswerIndex: 1,
      options: ['assets/images/gamified_xp/orange.jpg', 'assets/images/gamified_xp/yellow.jpg'],
    ),
    Question(
      soundPath: 'sounds/colors/orange.mp3',
      correctAnswerIndex: 0,
      options: ['assets/images/gamified_xp/orange.jpg', 'assets/images/gamified_xp/purple.jpg'],
    ),
    Question(
      soundPath: 'sounds/colors/purple.mp3',
      correctAnswerIndex: 1,
      options: ['assets/images/gamified_xp/brown.jpg', 'assets/images/gamified_xp/purple.jpg'],
    ),
    Question(
      soundPath: 'sounds/colors/black.mp3',
      correctAnswerIndex: 0,
      options: ['assets/images/gamified_xp/black.jpg', 'assets/images/gamified_xp/white.jpg'],
    ),
    Question(
      soundPath: 'sounds/colors/white.mp3',
      correctAnswerIndex: 1,
      options: ['assets/images/gamified_xp/gray.jpg', 'assets/images/gamified_xp/white.jpg'],
    ),
    Question(
      soundPath: 'sounds/colors/brown.mp3',
      correctAnswerIndex: 0,
      options: ['assets/images/gamified_xp/brown.jpg', 'assets/images/gamified_xp/black.jpg'],
    ),
    Question(
      soundPath: 'sounds/colors/gray.mp3',
      correctAnswerIndex: 0,
      options: ['assets/images/gamified_xp/gray.jpg', 'assets/images/gamified_xp/green.jpg'],
    ),
  ];
}

List<Question> getNumberQuestions() {
  return [
    Question(
      soundPath: 'sounds/digits/1.mp3',
      correctAnswerIndex: 0,
      options: ['assets/images/gamified_xp/one.jpg', 'assets/images/gamified_xp/two.jpg'],
    ),
    Question(
      soundPath: 'sounds/digits/2.mp3',
      correctAnswerIndex: 1,
      options: ['assets/images/gamified_xp/three.jpg', 'assets/images/gamified_xp/two.jpg'],
    ),
    Question(
      soundPath: 'sounds/digits/3.mp3',
      correctAnswerIndex: 0,
      options: ['assets/images/gamified_xp/three.jpg', 'assets/images/gamified_xp/four.jpg'],
    ),
    Question(
      soundPath: 'sounds/digits/4.mp3',
      correctAnswerIndex: 0,
      options: ['assets/images/gamified_xp/four.jpg', 'assets/images/gamified_xp/five.jpg'],
    ),
    Question(
      soundPath: 'sounds/digits/5.mp3',
      correctAnswerIndex: 0,
      options: ['assets/images/gamified_xp/five.jpg', 'assets/images/gamified_xp/six.jpg'],
    ),
    Question(
      soundPath: 'sounds/digits/6.mp3',
      correctAnswerIndex: 0,
      options: ['assets/images/gamified_xp/six.jpg', 'assets/images/gamified_xp/seven.jpg'],
    ),
    Question(
      soundPath: 'sounds/digits/7.mp3',
      correctAnswerIndex: 0,
      options: ['assets/images/gamified_xp/seven.jpg', 'assets/images/gamified_xp/eight.jpg'],
    ),
    Question(
      soundPath: 'sounds/digits/8.mp3',
      correctAnswerIndex: 1,
      options: ['assets/images/gamified_xp/nine.jpg', 'assets/images/gamified_xp/eight.jpg'],
    ),
    Question(
      soundPath: 'sounds/digits/9.mp3',
      correctAnswerIndex: 0,
      options: ['assets/images/gamified_xp/nine.jpg', 'assets/images/gamified_xp/ten.jpg'],
    ),
    Question(
      soundPath: 'sounds/digits/10.mp3',
      correctAnswerIndex: 0,
      options: ['assets/images/gamified_xp/ten.jpg', 'assets/images/gamified_xp/one.jpg'],
    ),
  ];
}

List<Question> getShapeQuestions() {
  return [
    Question(
      soundPath: 'sounds/shapes/circle.mp3',
      correctAnswerIndex: 0,
      options: ['assets/images/gamified_xp/circle.jpg', 'assets/images/gamified_xp/square.jpg'],
    ),
    Question(
      soundPath: 'sounds/shapes/square.mp3',
      correctAnswerIndex: 1,
      options: ['assets/images/gamified_xp/triangle.jpg', 'assets/images/gamified_xp/square.jpg'],
    ),
    Question(
      soundPath: 'sounds/shapes/triangle.mp3',
      correctAnswerIndex: 0,
      options: ['assets/images/gamified_xp/triangle.jpg', 'assets/images/gamified_xp/rectangle.jpg'],
    ),
    Question(
      soundPath: 'sounds/shapes/rectangle.mp3',
      correctAnswerIndex: 1,
      options: ['assets/images/gamified_xp/circle.jpg', 'assets/images/gamified_xp/rectangle.jpg'],
    ),
    Question(
      soundPath: 'sounds/shapes/star.mp3',
      correctAnswerIndex: 0,
      options: ['assets/images/gamified_xp/star.jpg', 'assets/images/gamified_xp/oval.jpg'],
    ),
    Question(
      soundPath: 'sounds/shapes/oval.mp3',
      correctAnswerIndex: 1,
      options: ['assets/images/gamified_xp/hexagon.jpg', 'assets/images/gamified_xp/oval.jpg'],
    ),
    Question(
      soundPath: 'sounds/shapes/hexagon.mp3',
      correctAnswerIndex: 0,
      options: ['assets/images/gamified_xp/hexagon.jpg', 'assets/images/gamified_xp/pentagon.jpg'],
    ),
    Question(
      soundPath: 'sounds/shapes/pentagon.mp3',
      correctAnswerIndex: 0,
      options: ['assets/images/gamified_xp/pentagon.jpg', 'assets/images/gamified_xp/square.jpg'],
    ),
    Question(
      soundPath: 'sounds/shapes/heart.mp3',
      correctAnswerIndex: 0,
      options: ['assets/images/gamified_xp/heart.jpg', 'assets/images/gamified_xp/diamond.jpg'],
    ),
    Question(
      soundPath: 'sounds/shapes/diamond.mp3',
      correctAnswerIndex: 1,
      options: ['assets/images/gamified_xp/triangle.jpg', 'assets/images/gamified_xp/diamond.jpg'],
    ),
  ];
}
