import 'package:flutter/material.dart';

class NoDataIndicator extends StatelessWidget {
  const NoDataIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Você ainda não possui uma anotação. Crie uma utilizando o botão no canto da tela!",
        textAlign: TextAlign.center,
        style: TextStyle(fontStyle: FontStyle.italic),
      ),
    );
  }
}
