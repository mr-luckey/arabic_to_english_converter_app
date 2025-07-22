import 'package:arabic_to_english_converter_app/management/alphabet_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_projects/management/alphabet_states.dart';

class AlphabetCubit extends Cubit<AlphabetState> {
  AlphabetCubit() : super(AlphabetInitial());

  void selectAlphabet(String alphabet, String soundPath) {
    emit(AlphabetSelected(alphabet: alphabet, soundPath: soundPath));
  }

  void clearSelection() {
    emit(AlphabetInitial());
  }
}
