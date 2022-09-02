import 'package:flutter/material.dart';
import 'package:note_it/common/database/connection/app_database.dart' as db;
import 'package:note_it/common/models/note_model.dart';
import 'package:note_it/common/repositories/note_repository.dart';
import 'package:note_it/common/utils/dialogs.dart';
import 'package:note_it/common/utils/messages.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

class CreateNoteViewModel {
  CreateNoteViewModel(this.context);

  late BuildContext context;
  var noteRepository = NoteRepository();

  void navigateBack() => Navigator.pop(context);

  void handleNavigateBack([bool? hasValidDataWaitingToSubmit]) {
    if (hasValidDataWaitingToSubmit == true) {
      _askForCloseConfirmation();

      return;
    }

    navigateBack();
  }

  void saveNote(Note note) async {
    var message = Message(context);
    var loading = LoadingDialog(context);

    loading.show();
    await Future.delayed(const Duration(seconds: 2, milliseconds: 500));

    var entity = db.Note(
      id: note.id ?? _uuid.v4(),
      title: note.title,
      description: note.description,
      datetime: note.datetime,
    );

    try {
      if (note.id == null) {
        await noteRepository.createNewNote(entity);
        message.success("Criado com sucesso!");
      } else {
        await noteRepository.updateNote(entity);
        message.success("Alterado com sucesso!");
      }

      loading.close();

      await Future.delayed(const Duration(milliseconds: 500));
      Navigator.pushReplacementNamed(context, '/home');
    } catch (e) {
      loading.close();
      message.error("Ops! Não foi possível salvar a operação...");
    }
  }

  void _askForCloseConfirmation() {
    var confirmationDialog = ConfirmationDialog(context);

    confirmationDialog.show(
      onConfirm: () => Navigator.pushReplacementNamed(context, '/home'),
      onDeny: () => navigateBack(),
    );
  }
}
