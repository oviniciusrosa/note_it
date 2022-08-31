import 'package:flutter/material.dart';
import 'package:note_it/common/database/connection/app_database.dart' as db;
import 'package:note_it/common/models/note_model.dart';
import 'package:note_it/common/repositories/note_repository.dart';
import 'package:note_it/common/utils/dialogs.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

class CreateNoteViewModel {
  CreateNoteViewModel(this.context);

  late BuildContext context;
  var noteRepository = NoteRepository();

  void navigateBack() => Navigator.pop(context);

  void createNote(Note note) async {
    var loading = LoadingDialog(context);
    loading.show();

    var entity = db.Note(
      id: _uuid.v4(),
      title: note.title,
      description: note.description,
      datetime: note.datetime,
    );

    await noteRepository.createNewNote(entity);

    loading.close();
    navigateBack();
  }
}
