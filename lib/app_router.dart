import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/bussiness_logic/characters_cubit.dart';
import 'package:movies_app/data/models/Characters_model.dart';
import 'package:movies_app/data/repository/characters_repository.dart';
import 'package:movies_app/data/web_services/characters_web_services.dart';
import 'package:movies_app/presentation/screens/characters_screen.dart';
import 'package:movies_app/presentation/screens/details_characters_screen.dart';

import 'constants/strings.dart';

class AppRouter {
  late CharactersRepository charactersRepository;

  late CharactersCubit charactersCubit;

  AppRouter() {
    charactersRepository = CharactersRepository(CharactarsWebServices());
    charactersCubit = CharactersCubit(charactersRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => charactersCubit,
            child: CharactersScreen(),
          ),
        );

      case detailsCharactersScreen:
        final character = settings.arguments as CharacterModel;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (context) => CharactersCubit(charactersRepository),
                child: DetailsCharactersScreen(
                  character: character,
                )));
    }
  }
}
