import 'package:flutter/material.dart';
import 'package:note_it/common/constants/theme_constants.dart';
import 'package:note_it/common/widgets/loaders/common_loader.dart';
import 'package:note_it/common/widgets/no_data_indicator.dart';
import 'package:note_it/common/widgets/typography/heading.dart';
import 'package:note_it/feature/home/viewmodel/home_viewmodel.dart';
import 'package:note_it/common/widgets/action_button.dart';
import 'package:note_it/common/widgets/note_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeViewModel _viewmodel;

  @override
  void initState() {
    super.initState();

    _viewmodel = HomeViewModel(context);
  }

  @override
  void dispose() {
    super.dispose();

    _viewmodel.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ActionButton(
        heroTag: "CREATE_NOTE_NAVIGATOR_BUTTON",
        onPressed: () => _viewmodel.navigateToNotesCriation(),
        type: ActionButtonType.greenAccent,
        icon: Icons.add,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: cDefaultPadding, vertical: cDefaultPadding * 0.8),
          child: CustomScrollView(slivers: [
            SliverFillRemaining(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Heading("Minhas anotações"),
                  const SizedBox(height: cDefaultPadding),
                  // TODO: SEARCH

                  StreamBuilder<List<dynamic>>(
                      stream: _viewmodel.getNotesList(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const CommonLoader();
                        }

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
                                  pressHandler: () => _viewmodel.inspectNote(note),
                                )
                            ],
                          );
                        }

                        return const NoDataIndicator();
                      }),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
