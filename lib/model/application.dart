import 'package:dart_frog_odbc/model/note.dart';

class Application {
  final int id;
  final String employer;
  final String title;
  final String link;
  final int companyId;
  final List<Note> notes;

  Application({
    required this.id,
    required this.employer,
    required this.title,
    required this.link,
    required this.companyId,
    required this.notes,
  });

  factory Application.fromMap(Map<String, dynamic> map) {
    var notesData = map['notes'] as List<dynamic>?;

    List<Note> notesList = [];
    if (notesData != null) {
      notesList = notesData
          .map((note) => Note.fromMap(note as Map<String, dynamic>?))
          .whereType<Note>()
          .cast<Note>()
          .toList();
    }

    return Application(
      id: map['id'] as int,
      employer: map['employer'] as String,
      title: map['title'] as String,
      link: map['link'] as String,
      companyId: map['company_id'] as int,
      notes: notesList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'employer': employer,
      'title': title,
      'link': link,
      'companyId': companyId,
      'notes': notes.map((note) => note.toJson()).toList(),
    };
  }
}
