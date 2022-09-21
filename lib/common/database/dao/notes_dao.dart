import 'package:drift/drift.dart';
import 'package:note_it/common/database/connection/app_database.dart';
import 'package:note_it/common/database/entities/note_entitiy.dart';

part 'notes_dao.g.dart';

@DriftAccessor(tables: [Notes])
class NotesDao extends DatabaseAccessor<AppDatabase> with _$NotesDaoMixin {
  NotesDao(AppDatabase db) : super(db);

  Stream<List<Note>> list() => select(notes).watch();

  Future<void> createNew(Note note) async => await into(notes).insert(note);

  Future<void> updateExistent(Note note) async => await update(notes).replace(note);

  Future<void> deleteExistent(Note note) async => await delete(notes).delete(note);
}
