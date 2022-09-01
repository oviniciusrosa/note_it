import 'package:flutter/material.dart';
import 'package:note_it/common/constants/theme_constants.dart';
import 'package:note_it/common/viewmodel/home_viewmodel.dart';
import 'package:note_it/common/widgets/action_button.dart';
import 'package:note_it/common/widgets/note_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeViewModel _viewModel;

  @override
  Widget build(BuildContext context) {
    _viewModel = HomeViewModel(context);

    return Scaffold(
      floatingActionButton: ActionButton(
        heroTag: "CREATE_NOTE_NAVIGATOR_BUTTON",
        onPressed: () {
          _viewModel.navigateToNotesCriation().then((value) => setState(() {}));
        },
        type: ActionButtonType.greenAccent,
        icon: Icons.add,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: cDefaultPadding, vertical: cDefaultPadding * 0.8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _header("Note It"),
                const SizedBox(height: cDefaultPadding * 0.4),
                // SEARCH

                _subtitle("Minhas anotações"),
                const SizedBox(height: cDefaultPadding * 0.4),

                FutureBuilder<List<dynamic>>(
                    future: _viewModel.getNotesList(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) return _loader();

                      if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                        var retrieveNote = snapshot.data ?? [];
                        var notes = retrieveNote.reversed.toList();

                        return ListView(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          children: [
                            for (var note in notes)
                              NoteCard(
                                title: note.title,
                                description: note.description,
                                pressHandler: () => _viewModel.inspectNote(note),
                              )
                          ],
                        );
                      }

                      return _noDataFound();
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _header(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
    );
  }

  Widget _subtitle(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
    );
  }

  Widget _loader() {
    return const Center(heightFactor: 10, child: CircularProgressIndicator());
  }

  Widget _noDataFound() {
    return const Center(
      heightFactor: 10,
      child: Text(
        "Você ainda não possui uma anotação. Crie uma utilizando o botão no canto da tela!",
        textAlign: TextAlign.center,
        style: TextStyle(fontStyle: FontStyle.italic),
      ),
    );
  }
}
