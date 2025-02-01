abstract class CharactersEvent {}

class FetchCharactersEvent extends CharactersEvent {
  final int? page;
  final String? name;
  final String? status;
  final String? gender;

  FetchCharactersEvent({this.name, this.page, this.gender, this.status});
}

class ResetCharacters extends CharactersEvent {}
