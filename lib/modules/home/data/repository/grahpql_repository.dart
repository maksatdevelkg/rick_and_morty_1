import 'package:rick_and_morty_1/core/service/graphql_service.dart';
import 'package:rick_and_morty_1/core/service/logger_service.dart';
import 'package:rick_and_morty_1/modules/home/data/model/character_model.dart';

class GraphQLRepository {
  final GraphQLService _service;

  GraphQLRepository(this._service);

  Future<Map<String, dynamic>> fetchCharacters({int page = 1}) async {
  const query = r'''
    query($page: Int) {
      characters(page: $page) {
        info {
          next
        }
        results {
          id
          name
          status
          species
          type
          gender
          image
        }
      }
    }
  ''';

  logger.i("📡 GraphQL → fetchCharacters(page: $page)");

  final result = await _service.performQuery(query, variables: {'page': page});
  final charactersData = result.data?['characters'];

  final results = charactersData['results'] as List<dynamic>;
  final nextPage = charactersData['info']['next'];

  return {
    'characters': results.map((json) => CharacterModel.fromJson(json)).toList(),
    'nextPage': nextPage,
  };
}


  
}
