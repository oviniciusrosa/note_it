import 'package:flutter/material.dart';

class AppInfos extends StatelessWidget {
  const AppInfos({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _appInfoText("Developed with ❤️ by Vinicius Rosa"),
        _appInfoText("1.0.0"),
      ],
    );
  }

  Widget _appInfoText(text) {
    return Center(
      child: Opacity(
        opacity: 0.8,
        child: Text(
          text,
          style: const TextStyle(fontSize: 11),
        ),
      ),
    );
  }
}
