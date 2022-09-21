import 'package:flutter/material.dart';
import 'package:note_it/common/viewmodel/splash_viewmodel.dart';
import 'package:note_it/common/widgets/app_infos.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SplashViewModel _viewmodel;

  @override
  void initState() {
    super.initState();

    _viewmodel = SplashViewModel(context);

    _viewmodel.goAhead();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/logo.png',
              height: 150,
            ),
          ),
          const Positioned(
            bottom: 20,
            child: AppInfos(),
          ),
        ],
      ),
    );
  }
}
