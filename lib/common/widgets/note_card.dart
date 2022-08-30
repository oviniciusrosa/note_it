import 'package:flutter/material.dart';
import 'package:note_it/common/constants/theme_constants.dart';

class NoteCard extends StatelessWidget {
  NoteCard({required this.title, required this.description, Key? key}) : super(key: key);

  String title;
  String description;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: cDefaultPadding * 0.6),
        decoration: BoxDecoration(color: cSecondaryColor, borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(cDefaultPadding * 0.7),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _title(title),
              const SizedBox(height: 7),
              _description(description),
            ],
          ),
        ),
      ),
    );
  }

  Widget _title(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: cContentColorLightTheme,
      ),
    );
  }

  Widget _description(String text) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      maxLines: 5,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: cContentColorLightTheme,
      ),
    );
  }
}
