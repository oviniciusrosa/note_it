import 'package:flutter/material.dart';
import 'package:note_it/common/models/note_model.dart';
import 'package:note_it/common/repositories/note_repository.dart';
import 'package:note_it/common/utils/dialogs.dart';

class CreateNoteViewModel {
  CreateNoteViewModel(this.context);

  late BuildContext context;
  var noteRepository = NoteRepository();

  void navigateBack() {
    Navigator.pop(context);
  }

  void createNote(Note note) async {
    var loading = LoadingDialog(context);

    loading.show();
    await noteRepository.createNewNote(note);
    loading.close();

    navigateBack();
  }
}
