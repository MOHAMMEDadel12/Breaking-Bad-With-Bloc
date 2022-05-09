import 'package:movies_app/data/models/Characters_model.dart';
import 'package:movies_app/data/models/quotes_model.dart';
import 'package:movies_app/data/web_services/characters_web_services.dart';

class CharactersRepository{

 final CharactarsWebServices charactarsWebServices ;

  CharactersRepository(this.charactarsWebServices);


 Future<List<CharacterModel>> getAllCharacters() async {

   final characters = await charactarsWebServices.getAllCharacters();
   return characters.map((character) => CharacterModel.fromJson(character)).toList();

 }

 Future<List<QuoteModel>> getCharacterQuotes(String charName) async {

   final quotes = await charactarsWebServices.getCharacterQuotes(charName);
   return quotes.map((charQuotes) => QuoteModel.fromJson(charQuotes)).toList();

 }

}