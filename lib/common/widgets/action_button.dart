import 'package:flutter/material.dart';
import 'package:note_it/common/constants/theme_constants.dart';

enum ActionButtonType { greenAccent, redAccent, blackAccent }

class ActionButton extends StatelessWidget {
  ActionButton({
    this.disabled = false,
    required this.heroTag,
    required this.icon,
    required this.type,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  IconData icon;
  ActionButtonType type;
  void Function() onPressed;
  late bool disabled = false;
  String heroTag;

  Widget _getChild() {
    return Icon(
      icon,
      color: Colors.white,
      size: 32,
    );
  }

  Color _getColor() {
    if (type == ActionButtonType.greenAccent) {
      return cSuccessColor;
    }

    if (type == ActionButtonType.redAccent) {
      return cErrorColor;
    }

    return cContentColorLightTheme;
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: disabled ? 0.6 : 1,
      child: FloatingActionButton(
        heroTag: heroTag,
        onPressed: onPressed,
        backgroundColor: _getColor(),
        child: _getChild(),
      ),
    );
  }
}
