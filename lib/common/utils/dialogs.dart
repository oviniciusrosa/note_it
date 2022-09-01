import 'package:flutter/material.dart';
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
        child: const AlertDialog(
          content: Text("Carregando..."),
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
