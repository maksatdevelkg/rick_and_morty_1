import 'package:rick_and_morty_1/modules/home/domain/entity/charater_entity.dart';
import 'package:rick_and_morty_1/modules/home/domain/repository/home_domaim_repository.dart';

class FetchAllCharactersUsecase {
  final HomeDomaimRepository _repository;

  FetchAllCharactersUsecase({required HomeDomaimRepository repository})
      : _repository = repository;
  Future<CharacterResponseEntity> execute(FetchAllCharactersParams params) {
    return _repository.getCharacters(params);
  }
}

class FetchAllCharactersParams {
  final int? page;
  final String? name;
  final String? status;
  final String? species;
  final String? type;
  final String? gender;

  FetchAllCharactersParams(
      {this.page,
      this.name,
      this.status,
      this.species,
      this.type,
      this.gender});
}
