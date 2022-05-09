import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/data/models/Characters_model.dart';
import 'package:movies_app/data/models/quotes_model.dart';
import 'package:movies_app/data/repository/characters_repository.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;

   List<CharacterModel> characters= [];

  CharactersCubit(this.charactersRepository) : super(CharactersInitial());

  List<CharacterModel> getAllCharacters() {
    charactersRepository.getAllCharacters().then((value) {
      emit(CharactersLoaded(value));
      this.characters = characters;
    }).catchError((error) {
      print(error.toString());
    });

    return characters;
  }


  void getQuotes(String charName) {
    charactersRepository.getCharacterQuotes(charName).then((quotes) {
      emit(QuotesLoaded(quotes));
    }).catchError((error) {
      print(error.toString());
    });

  }
}
