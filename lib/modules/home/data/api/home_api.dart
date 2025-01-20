import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:rick_and_morty_1/modules/home/data/model/character_model.dart';
import 'package:rick_and_morty_1/modules/home/data/model/episode_model.dart';
import 'package:rick_and_morty_1/modules/home/data/model/location_model.dart';

part 'home_api.g.dart'; 

@RestApi(baseUrl: "https://rickandmortyapi.com/api/")
abstract class HomeApi {
  factory HomeApi(Dio dio, {String baseUrl}) = _HomeApi;

  
  @GET("/character")
  Future<CharacterResponseModel> getCharacters({
    @Query("page") int? page,
    @Query("name") String? name,
    @Query("status") String? status,
    @Query("species") String? species,
    @Query("type") String? type,
    @Query("gender") String? gender,
    
  });

  
  @GET("/location")
  Future<LocationResponseModel> getLocations({
    @Query("page") int? page,
    @Query("name") String? name,
    @Query("type") String? type,
    @Query("dimension") String? dimension,
  });

  
  @GET("/episode")
  Future<EpisodeResponseModel> getEpisodes({
    @Query("page") int? page,
    @Query("name") String? name,
    @Query("episode") String? episode,
  });

  
  @GET("/character/{id}")
  Future<CharacterModel> getCharacterById(@Path("id") int id);

  
  @GET("/location/{id}")
  Future<LocationModel> getLocationById(@Path("id") int id);

  
  @GET("/episode/{id}")
  Future<EpisodeModel> getEpisodeById(@Path("id") int id);
}
