import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:note_it/common/constants/theme_constants.dart';
import 'package:note_it/common/viewmodel/welcome_viewmodel.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({Key? key}) : super(key: key);

  late WelcomeViewModel _viewModel;

  @override
  Widget build(BuildContext context) {
    _viewModel = WelcomeViewModel(context);
    var imageWidth = MediaQuery.of(context).size.width * 0.8;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Spacer(flex: 2),
              Lottie.asset(
                'assets/lottie/welcome_animation.json',
                width: imageWidth,
              ),
              const Spacer(),
              _title("Bem-vindo ao Note It!"),
              const SizedBox(height: 10),
              _subtitle("Organize-se, guarde ideias, registre metas e mais no seu aplicativo de anotações"),
              const SizedBox(height: 15),
              _accessButton(),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }

  Widget _title(String message) {
    return Text(
      message,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
    );
  }

  Widget _subtitle(String message) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Opacity(
        opacity: 0.6,
        child: Text(
          message,
          style: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _accessButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: InkWell(
        onTap: () => _viewModel.signIn(),
        child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            color: cSuccessColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Center(
            child: Text(
              "Entrar",
              style: TextStyle(fontSize: 18, color: cBackgroundColorLightTheme),
            ),
          ),
        ),
      ),
    );
  }
}
