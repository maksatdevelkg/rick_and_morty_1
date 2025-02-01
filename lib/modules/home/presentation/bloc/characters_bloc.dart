import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_1/core/enum/state_status.dart';
import 'package:rick_and_morty_1/modules/home/domain/entity/charater_entity.dart';
import 'package:rick_and_morty_1/modules/home/domain/usecases/fetch_all_characters_usecase.dart';
import 'package:rick_and_morty_1/modules/home/presentation/bloc/characters_event.dart';
import 'package:rick_and_morty_1/modules/home/presentation/bloc/characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  final FetchAllCharactersUsecase _fetchAllCharactersUsecase;
  List<CharacterEntity> characters = [];

  CharactersBloc({required FetchAllCharactersUsecase fetchAllCharactersUsecase})
      : _fetchAllCharactersUsecase = fetchAllCharactersUsecase,
        super(CharactersState(stutus: StateStatus.init)) {
     on <ResetCharacters> ((event, emit) => characters.clear(),);

    on<ResetCharacters>(
      (event, emit) {
        emit(CharactersState(
          stutus: StateStatus.init,
          characters: CharacterResponseEntity(results: [], count: 0, pages: 1),
        ));
      },
    );

 on<FetchCharactersEvent>(
  (event, emit) async {
    try {
      
      if (event.name != null) {
        characters.clear();
      }

      final result = await _fetchAllCharactersUsecase.execute(
        FetchAllCharactersParams(
            page: event.page, name: event.name, status: event.status),
      );

      characters.addAll(result.results);

      emit(CharactersState(
        stutus: StateStatus.success,
        characters: CharacterResponseEntity(
          results: characters,
          count: result.count,
          pages: result.pages,
        ),
      ));
    } catch (e) {
      emit(CharactersState(stutus: StateStatus.error));
    }
  },
);
  }
}
