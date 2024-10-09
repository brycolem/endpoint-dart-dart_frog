import 'package:dart_frog/dart_frog.dart';
import 'package:dart_frog_odbc/db.dart';
import 'package:dart_frog_odbc/model/application.dart';

Future<Response> onRequest(RequestContext context) async {
  await db.connect();

  final result = await db.connection.query('''
    SELECT a.*, json_agg(json_build_object('id', n.id, 'note_text', n.note_text, 'application_id', n.application_id)) as notes
    FROM applications a
    LEFT JOIN notes n ON a.id = n.application_id
    GROUP BY a.id
  ''');

  final applications = result.map((row) {
    return Application.fromMap(row.toColumnMap());
  }).toList();

  return Response.json(
    body: applications.map((app) => app.toJson()).toList(),
  );
}
