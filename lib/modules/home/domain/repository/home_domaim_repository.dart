import 'package:rick_and_morty_1/modules/home/data/model/character_model.dart';
import 'package:rick_and_morty_1/modules/home/data/model/episode_model.dart';
import 'package:rick_and_morty_1/modules/home/data/model/location_model.dart';
import 'package:rick_and_morty_1/modules/home/domain/usecases/fetch_all_characters_usecase.dart';

abstract class HomeDomaimRepository {
  Future<CharacterResponseModel> getCharacters(FetchAllCharactersParams params);

  Future<LocationResponseModel> getLocations(
    int page,
    String? name,
    String? type,
    String? dimension,
  );

  Future<EpisodeResponseModel> getEpisodes(
      int page, String? name, String? episodeCode);

  Future<CharacterModel> getCharacterById(int id);

  Future<LocationModel> getLocationById(int id);

  Future<EpisodeModel> getEpisodeById(int id);
}
