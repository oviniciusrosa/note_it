import 'dart:async';

import 'package:note_it/common/database/connection/app_database.dart';
import 'package:note_it/common/repositories/note_repository.dart';

class HomeViewModel {
  final _streamController = StreamController();
  final NoteRepository repository;

  HomeViewModel({required this.repository});

  Stream<List<Note>> getNotesList() {
    var listNoteStream = repository.listNote();
    if (_streamController.isClosed) _streamController.addStream(listNoteStream);

    return listNoteStream;
  }

  void dispose() {
    _streamController.close();
  }

  Future<void> deleteNote(Note note) => repository.deleteNote(note);
}
