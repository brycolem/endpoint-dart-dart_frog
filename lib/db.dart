import 'package:postgres/postgres.dart';
import 'dart:io';

class Database {
  late PostgreSQLConnection _connection;

  Database() {
    _connection = PostgreSQLConnection(
      Platform.environment['PG_HOST'] ?? 'postgres_bench',
      int.parse(Platform.environment['PG_PORT'] ?? '5432'),
      Platform.environment['DATABASE'] ?? 'your_database',
      username:
          Platform.environment['DB_USER'] ?? 'your_username',
      password:
          Platform.environment['DB_PWD'] ?? 'your_password',
    );
  }

  Future<void> connect() async {
    if (_connection.isClosed) {
      await _connection.open();
    }
  }

  PostgreSQLConnection get connection => _connection;

  void close() {
    if (!_connection.isClosed) {
      _connection.close();
    }
  }
}

final db = Database();
