import 'package:rick_and_morty_1/modules/home/domain/entity/location_entity.dart';

class LocationResponseModel extends LocationResponseEntity  {
  

  LocationResponseModel ({
     
   required super.count, required super.pages, required super.results});


factory LocationResponseModel.fromJson(Map<String, dynamic> json) {
    return LocationResponseModel(
      
      results: (json ['results'] as List).map((e) => LocationModel.fromJson(e)).toList(),
      count: json ['info']?['count'],
      pages: json ['info']?['pages'],
      );

  }
}





class LocationModel extends LocationEntity {
  LocationModel(
      {required super.id,
      required super.name,
      required super.type,
      required super.dimension,
      required super.residents,
      required super.url,
      required super.created});

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      dimension: json['dimension'],
      residents: List<String>.from(json['residents']),
      url: json['url'],
      created: json['created'],
    );
  }
}
