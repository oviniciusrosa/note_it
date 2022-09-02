import 'package:flutter/material.dart';
import 'package:note_it/common/database/connection/app_database.dart';
import 'package:note_it/common/repositories/note_repository.dart';
import 'package:note_it/common/utils/dialogs.dart';
import 'package:note_it/common/utils/messages.dart';
import 'package:note_it/common/widgets/inspect_note_content.dart';

class HomeViewModel {
  HomeViewModel(this.context);

  BuildContext context;
  var noteRepository = NoteRepository();

  Future<List<Note>> getNotesList() async {
    await Future.delayed(const Duration(milliseconds: 400));

    return await noteRepository.listNote();
  }

  Future<void> navigateToNotesCriation() => Navigator.pushNamed(context, "/create-note");

  void handleLogout() {
    var confirmationDialog = ConfirmationDialog(context);

    confirmationDialog.show(
      text: "Deseja mesmo sair?",
      confirmIcon: Icons.logout_rounded,
      onConfirm: () => Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false),
      onDeny: () => Navigator.pop(context),
    );
  }

  void inspectNote(Note note) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => DraggableScrollableSheet(
        initialChildSize: 0.5,
        minChildSize: 0.4,
        maxChildSize: 0.925,
        builder: (_, controller) => InspectNoteContent(note: note, controller: controller),
      ),
    );
  }

  void askForDeleteConfirmation(note) {
    var confirmationDialog = ConfirmationDialog(context);

    confirmationDialog.show(
      text: "Você está prestes a deletar esta anotação. Deseja continuar?",
      onConfirm: () => _handleDeleteNote(note),
      onDeny: () => Navigator.pop(context),
    );
  }

  void _handleDeleteNote(note) async {
    var message = Message(context);

    try {
      await noteRepository.deleteNote(note);

      Navigator.pop(context);

      message.success("Deletado com sucesso!");
      await Future.delayed(const Duration(milliseconds: 500));

      Navigator.pushReplacementNamed(context, '/home');
    } catch (e) {
      message.error("Ops! Não foi possível deletar o item...");
      Navigator.pop(context);
    }
  }
}
