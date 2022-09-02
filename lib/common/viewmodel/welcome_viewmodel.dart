import 'package:flutter/cupertino.dart';
import 'package:note_it/common/repositories/auth_repository.dart';
import 'package:note_it/common/utils/messages.dart';

class WelcomeViewModel {
  WelcomeViewModel(this.context);

  BuildContext context;
  final repository = AuthRepository();

  void signIn() async {
    var message = Message(context);

    try {
      dynamic response = await repository.defaultLogin();
      if (response != null) {
        message.success('Login efetuado com sucesso!');
        await Future.delayed(const Duration(milliseconds: 600));

        Navigator.pushReplacementNamed(context, '/home');
        return;
      }

      message.error('Login inválido!');
    } catch (e) {
      message.error('Não foi possível efetuar o login!');
    }
  }
}
