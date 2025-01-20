import 'package:rick_and_morty_1/core/enum/state_status.dart';
import 'package:rick_and_morty_1/modules/home/domain/entity/charater_entity.dart';

class CharactersState {
  final StateStatus stutus;
  final CharacterResponseEntity? characters;

  CharactersState({required this.stutus,  this.characters});
}