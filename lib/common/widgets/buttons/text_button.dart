import 'package:flutter/material.dart';
import 'package:note_it/common/constants/theme_constants.dart';

class DefaultTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  Color color = cSuccessColor;

  DefaultTextButton({
    required this.text,
    required this.onTap,
    this.color = cSuccessColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: cSuccessColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(fontSize: 18, color: cBackgroundColorLightTheme),
          ),
        ),
      ),
    );
  }
}
