import 'package:flutter/material.dart';
import 'package:note_it/common/views/create_note_screen.dart';
import 'package:note_it/feature/home/screens/home_screen.dart';
import 'package:note_it/feature/app_initialization/screens/splash_screen.dart';
import 'package:note_it/feature/app_initialization/screens/welcome_screen.dart';
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
        "/": (context) => const SplashScreen(),
        "/welcome": (context) => WelcomeScreen(),
        "/home": (context) => const HomeScreen(),
        "/create-note": (context) => const CreateNoteScreen(),
      },
    );
  }
}
