
class EpisodeResponseEntity {
  
  final List<EpisodeEntity> results;
  final int? count;
  final int? pages;

  EpisodeResponseEntity({
    required this.count,
    required this.pages,
    required this.results,
  });

  
  }


  class EpisodeEntity {
  final int id;
  final String name;
  final String airDate;
  final String episode;
  final List<String> characters;
  final String url;
  final String created;

  EpisodeEntity({
    required this.id,
    required this.name,
    required this.airDate,
    required this.episode,
    required this.characters,
    required this.url,
    required this.created,
  });

  
}