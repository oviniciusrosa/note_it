import 'package:flutter/material.dart';
import 'package:note_it/common/database/connection/app_database.dart';
import 'package:note_it/feature/home/viewmodel/home_viewmodel.dart';
import 'package:note_it/common/widgets/action_button.dart';
import 'package:note_it/common/widgets/draggable_sheet_indicator.dart';

class InspectNoteContent extends StatelessWidget {
  InspectNoteContent({
    required this.note,
    required this.controller,
    Key? key,
  }) : super(key: key);

  Note note;
  ScrollController controller;

  late HomeViewModel _viewModel;

  @override
  Widget build(BuildContext context) {
    _viewModel = HomeViewModel(context);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: Column(
          children: [
            Expanded(
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
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ActionButton(
                    heroTag: "CLOSE_MODAL_SHEET",
                    onPressed: () => Navigator.pop(context),
                    type: ActionButtonType.blackAccent,
                    icon: Icons.close,
                  ),
                  Row(
                    children: [
                      ActionButton(
                        heroTag: "DELETE_NOTE_BUTTON",
                        onPressed: () => _viewModel.askForDeleteConfirmation(note),
                        type: ActionButtonType.redAccent,
                        icon: Icons.delete,
                      ),
                      const SizedBox(width: 15),
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
            )
          ],
        ),
      ),
    );
  }
}
