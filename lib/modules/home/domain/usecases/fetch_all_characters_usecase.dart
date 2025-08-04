import 'package:rick_and_morty_1/modules/home/data/model/character_model.dart';
import 'package:rick_and_morty_1/modules/home/data/repository/grahpql_repository.dart';
import 'package:rick_and_morty_1/modules/home/domain/entity/charater_entity.dart';
import 'package:rick_and_morty_1/modules/home/domain/repository/home_domaim_repository.dart';

class FetchAllCharactersUsecase {
  final HomeDomaimRepository _repository;
  final GraphQLRepository _graphqlRepository;

  FetchAllCharactersUsecase({required HomeDomaimRepository repository, required GraphQLRepository graphqlRepository})
      : _repository = repository, _graphqlRepository = graphqlRepository;
  Future<CharacterResponseEntity> execute(FetchAllCharactersParams params) async {
  if (params.useGraphQL) {
    final response = await _graphqlRepository.fetchCharacters(page: params.page ?? 1);
    final characters = response['characters'] as List<CharacterModel>;
    final nextPage = response['nextPage'] as int?;

    return CharacterResponseEntity(
      results: characters,
      count: characters.length,
      pages: nextPage ?? 0, 
    );
  } else {
    return _repository.getCharacters(params);
  }
}


 

}

class FetchAllCharactersParams {
  final int? page;
  final String? name;
  final String? status;
  final String? species;
  final String? type;
  final String? gender;
  final bool useGraphQL;

  FetchAllCharactersParams(
      {this.page,
      this.name,
      this.status,
      this.species,
      this.type,
      this.gender,
      this.useGraphQL = false});
}
