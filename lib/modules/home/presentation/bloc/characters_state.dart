import 'package:rick_and_morty_1/core/enum/data_source_type.dart';
import 'package:rick_and_morty_1/core/enum/state_status.dart';
import 'package:rick_and_morty_1/modules/home/domain/entity/charater_entity.dart';


class CharactersState {
  final StateStatus stutus;
  final CharacterResponseEntity? characters;
  final DataSource dataSource;

  CharactersState({
    required this.stutus,
    this.characters,
     required this.dataSource,
  });

  CharactersState copyWith({
    StateStatus? stutus,
    CharacterResponseEntity? characters,
    DataSource? dataSource,
  }) {
    return CharactersState(
      stutus: stutus ?? this.stutus,
      characters: characters ?? this.characters,
      dataSource: dataSource ?? this.dataSource,
    );
  }

  factory CharactersState.initial() {
    return CharactersState(
      stutus: StateStatus.init,
      characters: null,
      dataSource: DataSource.rest, 
    );
  }
}
