enum DataSource { rest, graphql }

extension DataSourceLabel on DataSource {
  String get label => this == DataSource.rest ? 'REST API' : 'GraphQL';
}
