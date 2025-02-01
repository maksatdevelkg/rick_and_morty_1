import 'package:rick_and_morty_1/modules/home/domain/entity/charater_entity.dart';

class CharacterModel extends CharacterEntity {
  CharacterModel({
    required super.id,
    required super.name,
    required super.status,
    required super.species,
    required super.type,
    required super.gender,
    required super.image,
  });
  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      species: json['species'],
      type: json['type'],
      gender: json['gender'],
      image: json['image'],
    );
  }
}



class CharacterResponseModel extends CharacterResponseEntity {
  CharacterResponseModel(   {required super.results, required super.pages, required super.count,  });
  factory CharacterResponseModel.fromJson(Map<String, dynamic> json) {
    return CharacterResponseModel(
       pages: json['info']['pages'],
      count: json['info']['count'],
        results: List<CharacterModel>.from(
          json['results'].map((x) => CharacterModel.fromJson(x)),
          
        ),
        
        );
  }
}
