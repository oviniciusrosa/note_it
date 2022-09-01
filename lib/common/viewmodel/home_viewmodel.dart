import 'package:flutter/material.dart';
import 'package:note_it/common/database/connection/app_database.dart';
import 'package:note_it/common/repositories/note_repository.dart';
import 'package:note_it/common/widgets/action_button.dart';
import 'package:note_it/common/widgets/draggable_sheet_indicator.dart';

class HomeViewModel {
  HomeViewModel(this.context);

  BuildContext context;
  var noteRepository = NoteRepository();

  Future<List<Note>> getNotesList() async {
    await Future.delayed(const Duration(milliseconds: 400));

    return await noteRepository.listNote();
  }

  Future<void> navigateToNotesCriation() => Navigator.pushNamed(context, "/create-note");

  void inspectNote(Note note) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => DraggableScrollableSheet(
        initialChildSize: 0.5,
        minChildSize: 0.4,
        maxChildSize: 0.925,
        builder: (_, controller) => Container(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            controller: controller,
            children: [
              const DraggableSheetIndicator(),
              const SizedBox(height: 20),
              Text(
                note.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(note.description),
              // const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ActionButton(
                    heroTag: "CLOSE_MODAL_SHEET",
                    onPressed: () => Navigator.pop(context),
                    type: ActionButtonType.blackAccent,
                    icon: Icons.close,
                  ),
                  const SizedBox(width: 50),
                  ActionButton(
                    heroTag: "EDIT_NOTE_NAVIGATOR_BUTTON",
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/create-note', arguments: note);
                    },
                    type: ActionButtonType.greenAccent,
                    icon: Icons.edit,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
