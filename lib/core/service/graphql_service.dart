import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLService {
  late final GraphQLClient client;

  GraphQLService() {
    final HttpLink httpLink = HttpLink('https://rickandmortyapi.com/graphql');

    client = GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(store: InMemoryStore()),
    );
  }

  Future<QueryResult> performQuery(String query, {Map<String, dynamic>? variables}) async {
    final options = QueryOptions(
      document: gql(query),
      variables: variables ?? {},
    );
    return await client.query(options);
  }
}
