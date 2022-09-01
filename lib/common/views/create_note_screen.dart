import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:note_it/common/constants/theme_constants.dart';
import 'package:note_it/common/models/note_model.dart';
import 'package:note_it/common/viewmodel/create_note_viewmodel.dart';
import 'package:note_it/common/widgets/action_button.dart';
import 'package:note_it/common/database/connection/app_database.dart' as app_database;

class CreateNoteScreen extends StatelessWidget {
  CreateNoteScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  final double _textContentFontSize = 16;
  final double _verticalPadding = cDefaultPadding * 0.8;

  var currentNote = Note(id: null, title: "", description: "", datetime: "");

  late CreateNoteViewModel _viewmodel;

  @override
  Widget build(BuildContext context) {
    _viewmodel = CreateNoteViewModel(context);

    bool enableConfirmButton = currentNote.title.isNotEmpty && currentNote.description.isNotEmpty;

    final incomingNote = ModalRoute.of(context)?.settings.arguments as app_database.Note?;
    var initialTitle = incomingNote?.title ?? "";
    var initialDescription = incomingNote?.description ?? "";

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: cDefaultPadding * 0.8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ActionButton(
              heroTag: "GO_BACK_NAVIGATOR_BUTTON",
              icon: Icons.arrow_back,
              onPressed: () => _viewmodel.handleNavigateBack(enableConfirmButton),
              type: ActionButtonType.blackAccent,
            ),
            ActionButton(
              disabled: !enableConfirmButton,
              heroTag: "CONFIRM_NOTE_BUTTON",
              icon: Icons.check,
              onPressed: () {
                currentNote.id = incomingNote?.id;
                if (enableConfirmButton) _viewmodel.saveNote(currentNote);
              },
              type: ActionButtonType.greenAccent,
            )
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: cDefaultPadding, vertical: _verticalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _getTitleTextField(initialTitle),
                const SizedBox(height: cDefaultPadding * 0.4),
                Text(
                  _getCurrentDateTime(),
                  style: const TextStyle(color: cPlaceholderLightTheme, fontSize: 12),
                ),
                const SizedBox(height: cDefaultPadding * 0.2),
                _getContentTextField(context, initialDescription),
                const SizedBox(height: cDefaultPadding * 2),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getTitleTextField(initialValue) {
    return TextFormField(
      initialValue: initialValue,
      onChanged: (value) => currentNote.title = value,
      decoration: const InputDecoration(hintText: 'Escreva o título', border: InputBorder.none),
      autofocus: false,
      maxLines: 1,
      style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      keyboardType: TextInputType.multiline,
    );
  }

  Widget _getContentTextField(BuildContext context, initialValue) {
    double minLines = (MediaQuery.of(context).size.height / _textContentFontSize) - _verticalPadding * 2;

    return Padding(
      padding: const EdgeInsets.only(bottom: 40.0),
      child: TextFormField(
        initialValue: initialValue,
        onChanged: (value) => currentNote.description = value,
        decoration: const InputDecoration(
          isDense: true,
          hintText: 'Escreva o conteúdo aqui...',
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        ),
        autofocus: false,
        maxLines: null,
        minLines: minLines.toInt(),
        style: TextStyle(fontSize: _textContentFontSize),
        keyboardType: TextInputType.multiline,
      ),
    );
  }

  String _getCurrentDateTime() {
    var now = DateTime.now();
    String formattedDate = DateFormat('dd/MM/yyyy').format(now);
    String currentDateTime = '$formattedDate às ${now.hour}:${now.minute}';

    currentNote.datetime = currentDateTime;

    return currentDateTime;
  }
}
