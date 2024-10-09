class Note {
  final int id;
  final String noteText;
  final int applicationId;

  Note({
    required this.id,
    required this.noteText,
    required this.applicationId,
  });

  static Note? fromMap(Map<String, dynamic>? map) {
    if (map == null ||
        map['id'] == null ||
        map['application_id'] == null ||
        map['note_text'] == null) {
      return null;
    }

    return Note(
      id: map['id'] as int,
      noteText: map['note_text'] as String,
      applicationId: map['application_id'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'noteText': noteText,
      'applicationId': applicationId,
    };
  }
}
