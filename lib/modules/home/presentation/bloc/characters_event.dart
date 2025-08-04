abstract class CharactersEvent {}

class FetchCharactersEvent extends CharactersEvent {
  final int? page;
  final String? name;
  final String? status;
  final String? gender;
  final String? sortOrder;
  final bool? useGraphQL;

  FetchCharactersEvent({
    this.name,
    this.page,
    this.gender,
    this.status,
    this.sortOrder,
    this.useGraphQL,
  });
}

class ResetCharacters extends CharactersEvent {}

class ToggleDataSourceEvent extends CharactersEvent {}
