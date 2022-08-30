import 'package:flutter/material.dart';
import 'package:note_it/common/constants/theme_constants.dart';
import 'package:note_it/common/viewmodel/home_viewmodel.dart';
import 'package:note_it/common/widgets/action_button.dart';
import 'package:note_it/common/widgets/note_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  late HomeViewModel _viewModel;

  @override
  Widget build(BuildContext context) {
    _viewModel = HomeViewModel(context);

    return Scaffold(
      floatingActionButton: ActionButton(
        heroTag: "CREATE_NOTE_NAVIGATOR_BUTTON",
        onPressed: () => _viewModel.navigateToNotesCriation(),
        type: ActionButtonType.greenAccent,
        icon: Icons.add,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: cDefaultPadding, vertical: cDefaultPadding * 0.8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _header("Note It"),
                const SizedBox(height: cDefaultPadding * 0.4),
                // SEARCH

                _subtitle("Minhas notas"),
                const SizedBox(height: cDefaultPadding * 0.4),

                ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    for (var i in List.generate(6, (index) => index))
                      NoteCard(
                        title: "Bunda",
                        description: '$i dale',
                      )
                  ],
                )
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
}
