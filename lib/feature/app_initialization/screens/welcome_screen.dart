import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:note_it/common/widgets/app_infos.dart';
import 'package:note_it/common/widgets/buttons/text_button.dart';
import 'package:note_it/common/widgets/typography/heading.dart';
import 'package:note_it/feature/app_initialization/viewmodel/welcome_viewmodel.dart';
import 'package:note_it/feature/app_initialization/widgets/welcome_subtitle.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({Key? key}) : super(key: key);

  final _viewmodel = WelcomeViewModel();

  @override
  Widget build(BuildContext context) {
    var imageWidth = MediaQuery.of(context).size.width * 0.8;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Spacer(flex: 4),
              Lottie.asset(
                'assets/lottie/welcome_animation.json',
                width: imageWidth,
              ),
              const Spacer(flex: 2),
              Heading("Bem-vindo ao Note It!"),
              const SizedBox(height: 10),
              const WelcomeSubtitle("Organize-se, guarde ideias, registre metas e mais no seu aplicativo de anotações"),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: DefaultTextButton(
                  text: "Avançar",
                  onTap: () => _viewmodel.signIn().then((_) {
                    Navigator.pushReplacementNamed(context, '/home');
                  }),
                ),
              ),
              const Spacer(flex: 4),
              const AppInfos(),
              const Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}
