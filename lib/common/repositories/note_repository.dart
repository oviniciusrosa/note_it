import 'package:note_it/common/models/note_model.dart';

class NoteRepository {
  Future<bool> createNewNote(Note note) async {
    await Future.delayed(const Duration(seconds: 2));

    return true;
  }
}
