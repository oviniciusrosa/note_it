import 'package:note_it/common/database/connection/app_database.dart' as app_database;
import 'package:note_it/common/database/dao/notes_dao.dart';

class NoteRepository {
  Stream<List<app_database.Note>> listNote() => NotesDao(app_database.db).list();

  Future<void> createNewNote(app_database.Note note) async {
    return await NotesDao(app_database.db).createNew(note);
  }

  Future<void> updateNote(app_database.Note note) async {
    return await NotesDao(app_database.db).updateExistent(note);
  }

  Future<void> deleteNote(app_database.Note note) async {
    return await NotesDao(app_database.db).deleteExistent(note);
  }
}
