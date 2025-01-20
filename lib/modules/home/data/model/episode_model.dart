import 'package:rick_and_morty_1/modules/home/domain/entity/episode_entity.dart';

class EpisodeResponseModel extends EpisodeResponseEntity {
  EpisodeResponseModel({
    required super.results,
    required super.count,
    required super.pages,
  });

  factory EpisodeResponseModel.fromJson(Map<String, dynamic> json) {
    return EpisodeResponseModel(
        results: (json['results'] as List)
            .map((e) => EpisodeModel.fromJson(e))
            .toList(),
        count: json['info']?['count'],
        pages: json['info']?['pages']);
  }
}

class EpisodeModel extends EpisodeEntity {
  EpisodeModel(
      {required super.id,
      required super.name,
      required super.airDate,
      required super.episode,
      required super.characters,
      required super.url,
      required super.created});

  factory EpisodeModel.fromJson(Map<String, dynamic> json) {
    return EpisodeModel(
      id: json['id'],
      name: json['name'],
      airDate: json['air_date'],
      episode: json['episode'],
      characters: List<String>.from(json['characters']),
      url: json['url'],
      created: json['created'],
    );
  }

  get results => null;
}
