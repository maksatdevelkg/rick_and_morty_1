class CharacterEntity {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final String image;
  

  CharacterEntity({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.image,
    
  });

 

  
}

class CharacterResponseEntity {
  final List<CharacterEntity> results;

  CharacterResponseEntity({required this.results});

  
}
