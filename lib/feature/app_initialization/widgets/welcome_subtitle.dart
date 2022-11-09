import 'package:flutter/material.dart';
import 'package:note_it/common/widgets/typography/subtitle.dart';

class WelcomeSubtitle extends StatelessWidget {
  final String text;
  const WelcomeSubtitle(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Opacity(
        opacity: 0.6,
        child: Subtitle(
          text,
          align: TextAlign.center,
        ),
      ),
    );
  }
}
