abstract class AlphabetState {}

class AlphabetInitial extends AlphabetState {}

class AlphabetSelected extends AlphabetState {
  final String alphabet;
  final String soundPath;

  AlphabetSelected({required this.alphabet, required this.soundPath});
}
