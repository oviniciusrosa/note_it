import 'package:flutter/material.dart';
import 'package:note_it/common/widgets/app_infos.dart';
import 'package:note_it/feature/app_initialization/viewmodel/splash_viewmodel.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _viewmodel = SplashViewModel();

  @override
  void initState() {
    super.initState();

    _viewmodel.goAhead(
      onFinish: (route) => navigateTo(route),
    );
  }

  void navigateTo(String route) => Navigator.of(context).pushReplacementNamed(route);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Center(child: Image.asset('assets/logo.png', height: 150)),
          const Positioned(
            bottom: 20,
            child: AppInfos(),
          ),
        ],
      ),
    );
  }
}
