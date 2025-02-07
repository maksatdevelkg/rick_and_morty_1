abstract class CharactersEvent {}

class FetchCharactersEvent extends CharactersEvent {
  final int? page;
  final String? name;
  final String? status;
  final String? gender;
  final String? sortOrder;
  

  FetchCharactersEvent(  {this.name, this.page, this.gender, this.status, this.sortOrder, });
}

class ResetCharacters extends CharactersEvent {}
