import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:note_it/common/constants/theme_constants.dart';
import 'package:note_it/common/widgets/action_button.dart';

class LoadingDialog {
  LoadingDialog(this.context);

  BuildContext context;

  void close() => Navigator.pop(context);

  void show() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => WillPopScope(
        onWillPop: () => Future.value(false),
        child: AlertDialog(
          backgroundColor: Colors.transparent,
          content: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset('assets/lottie/saving_note_animation.json', width: 120),
                const Text(
                  'Salvando...',
                  style: TextStyle(
                    color: cBackgroundColorLightTheme,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ConfirmationDialog {
  ConfirmationDialog(this.context);

  BuildContext context;

  void close() => Navigator.pop(context);

  void show({onConfirm, onDeny}) {
    showDialog(
      context: context,
      useRootNavigator: false,
      builder: (context) => AlertDialog(
        content: SizedBox(
          height: 130,
          child: Column(
            children: [
              const Text("Ao sair, essa anotação será descartada. Deseja continuar?"),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ActionButton(
                    heroTag: "CANCEL_BUTTON",
                    icon: Icons.close,
                    onPressed: onDeny,
                    type: ActionButtonType.blackAccent,
                  ),
                  ActionButton(
                    heroTag: "CONFIRM_BUTTON",
                    icon: Icons.delete,
                    onPressed: onConfirm,
                    type: ActionButtonType.redAccent,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
