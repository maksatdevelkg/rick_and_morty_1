import 'package:rick_and_morty_1/modules/home/data/api/home_api.dart';
import 'package:rick_and_morty_1/modules/home/data/model/character_model.dart';
import 'package:rick_and_morty_1/modules/home/data/model/episode_model.dart';
import 'package:rick_and_morty_1/modules/home/data/model/location_model.dart';
import 'package:rick_and_morty_1/modules/home/domain/repository/home_domaim_repository.dart';
import 'package:rick_and_morty_1/modules/home/domain/usecases/fetch_all_characters_usecase.dart';

class HomeRepository implements HomeDomaimRepository {

  final HomeApi _homeApi;

  HomeRepository({required HomeApi homeApi}) : _homeApi = homeApi;

  @override
  Future<CharacterModel> getCharacterById(int id) {
    return _homeApi.getCharacterById(id);
  }

  

  @override
  Future<EpisodeModel> getEpisodeById(int id) {
    return _homeApi.getEpisodeById(id);
  }

  

  @override
  Future<LocationModel> getLocationById(int id) {
    return _homeApi.getLocationById(id);
  }
  
  @override
  Future<LocationResponseModel> getLocations(int? page, String? name, String? type, String? dimension) {
    return _homeApi.getLocations();
  }
  
  @override
  Future<EpisodeResponseModel> getEpisodes(int page, String? name, String? episodeCode) {
    return _homeApi.getEpisodes();
  }
  
  @override
  Future<CharacterResponseModel> getCharacters(FetchAllCharactersParams params) {
    return _homeApi.getCharacters(page:  params.page ?? 0,
    name: params.name,
    status: params.status,
    species: params.species,
    type: params.type,
    gender: params.gender,);
  }

  
}