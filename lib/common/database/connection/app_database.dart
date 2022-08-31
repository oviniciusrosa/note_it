import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:note_it/common/database/dao/notes_dao.dart';
import 'package:note_it/common/database/entities/note_entitiy.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

part 'app_database.g.dart';

LazyDatabase _createConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'note_it_app_db.sqlite'));

    return NativeDatabase(file);
  });
}

@DriftDatabase(daos: [NotesDao], tables: [Notes])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_createConnection());

  @override
  int get schemaVersion => 1;
}

final db = AppDatabase();
