import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Notes extends Table {
  TextColumn get id => text().named("id")();
  TextColumn get title => text().named("title")();
  TextColumn get description => text().named("description")();
  TextColumn get datetime => text().named("datetime")();

  @override
  Set<Column> get primaryKey => {id};
}
