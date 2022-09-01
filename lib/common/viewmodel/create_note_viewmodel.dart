import 'package:flutter/material.dart';
import 'package:note_it/common/database/connection/app_database.dart' as db;
import 'package:note_it/common/models/note_model.dart';
import 'package:note_it/common/repositories/note_repository.dart';
import 'package:note_it/common/utils/dialogs.dart';
import 'package:note_it/common/widgets/action_button.dart';
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

  void _askForCloseConfirmation() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: SizedBox(
          height: 130,
          child: Column(
            children: [
              const Text("Ao sair, essa nota será descartada. Deseja continuar?"),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ActionButton(
                    heroTag: "CANCEL_BUTTON",
                    icon: Icons.close,
                    onPressed: () => navigateBack(),
                    type: ActionButtonType.blackAccent,
                  ),
                  ActionButton(
                    heroTag: "CONFIRM_BUTTON",
                    icon: Icons.delete,
                    onPressed: () => Navigator.pushReplacementNamed(context, '/'),
                    type: ActionButtonType.redAccent,
                  ),
                ],
              ),
            ],
          ),
        ),
        // content: const Text("Ao sair, essa nota será descartada. Deseja continuar?"),
      ),
    );
  }
}
