import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_1/core/enum/data_source_type.dart';
import 'package:rick_and_morty_1/core/enum/state_status.dart';
import 'package:rick_and_morty_1/modules/home/domain/entity/charater_entity.dart';
import 'package:rick_and_morty_1/modules/home/domain/usecases/fetch_all_characters_usecase.dart';
import 'package:rick_and_morty_1/modules/home/presentation/bloc/characters_event.dart';
import 'package:rick_and_morty_1/modules/home/presentation/bloc/characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  final FetchAllCharactersUsecase _fetchAllCharactersUsecase;
  List<CharacterEntity> characters = [];
  bool useGraphQL = false;
  int? _nextPage;


  CharactersBloc({required FetchAllCharactersUsecase fetchAllCharactersUsecase})
      : _fetchAllCharactersUsecase = fetchAllCharactersUsecase,
        super(CharactersState(
            stutus: StateStatus.init, dataSource: DataSource.rest)) {
    on<ToggleDataSourceEvent>((event, emit) async {
      useGraphQL = !useGraphQL;
      characters.clear();
      _nextPage = 2;
       print('📤 Emitting init');
      emit(CharactersState(
        stutus: StateStatus.init,
        characters: CharacterResponseEntity(results: [], count: 0, pages: 0),
        dataSource: useGraphQL ? DataSource.graphql : DataSource.rest,
      ));
       
    });

    

    on<ResetCharacters>(
      (event, emit) => characters.clear(),
    );

    on<FetchCharactersEvent>(
      (event, emit) async {
        try {
          if (event.useGraphQL != null) {
      useGraphQL = event.useGraphQL!;
    }

          final result = await _fetchAllCharactersUsecase.execute(
            FetchAllCharactersParams(
              page: event.page,
              name: event.name,
              status: event.status,
              gender: event.gender,
              useGraphQL: useGraphQL,
            ),
          );

          characters.addAll(result.results);

          if (useGraphQL) {
  _nextPage = result.pages; 
}



          if (event.sortOrder == 'asc') {
            characters.sort((a, b) => a.name.compareTo(b.name));
          } else if (event.sortOrder == 'desc') {
            characters.sort((a, b) => b.name.compareTo(a.name));
          }

          print('✅ Characters loaded: ${characters.length}');
          print('📦 Result count: ${result.count}, pages: ${result.pages}');
          print('🧠 Data source: ${useGraphQL ? 'GraphQL' : 'REST'}');


          emit(CharactersState(
            stutus: StateStatus.success,
            characters: CharacterResponseEntity(
              results: characters,
              count: result.count ?? characters.length,
              pages: result.pages ?? 1,
            ),
            dataSource: (event.useGraphQL ?? useGraphQL)
                ? DataSource.graphql
                : DataSource.rest,
          ));
          print('🧪 GraphQL result.count: ${result.count}, pages: ${result.pages}');

        } catch (e, stack) {
  print('❌ Error in CharactersBloc: $e');
  print(stack);
  emit(CharactersState(
    stutus: StateStatus.error,
    characters: null,
    dataSource: DataSource.graphql
  ));
}

      },
    );
  }
  int? get nextPage => _nextPage;

}
