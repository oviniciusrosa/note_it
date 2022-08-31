import 'package:flutter/material.dart';
import 'package:note_it/common/database/connection/app_database.dart';
import 'package:note_it/common/repositories/note_repository.dart';

class HomeViewModel {
  HomeViewModel(this.context);

  BuildContext context;
  var noteRepository = NoteRepository();

  Future<List<Note>> getNotesList() async {
    await Future.delayed(const Duration(seconds: 2));

    return await noteRepository.listNote();
  }

  Future<void> navigateToNotesCriation() => Navigator.pushNamed(context, "/create-note");
}
