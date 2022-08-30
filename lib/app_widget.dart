import 'package:flutter/material.dart';
import 'package:note_it/common/views/create_note_screen.dart';
import 'package:note_it/common/views/home_screen.dart';
import 'package:note_it/theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: lightThemeData(context),
      darkTheme: darkThemeData(context),
      initialRoute: "/",
      routes: {
        "/": (context) => HomeScreen(),
        "/create-note": (context) => CreateNoteScreen(),
      },
    );
  }
}
