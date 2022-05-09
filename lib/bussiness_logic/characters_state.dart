part of 'characters_cubit.dart';

@immutable
abstract class CharactersState {}

class CharactersInitial extends CharactersState {}

class CharactersLoaded extends CharactersState {
  final List<CharacterModel> characterModel;

  CharactersLoaded(this.characterModel);
}

class CharacterError extends CharactersState {}

class QuotesLoaded extends CharactersState {
  final List<QuoteModel> quoteModel;

  QuotesLoaded(this.quoteModel);
}

class QuotesError extends CharactersState {}


