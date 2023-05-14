import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thidle/app.dart';
import 'package:thidle/login.dart';
import 'package:thidle/menu.dart';
import 'package:thidle/profile/profile2.dart';

void main() {
  runApp(const Thidle());
}

class Thidle extends StatelessWidget {
  const Thidle({super.key});
  
  static Color defaultColor = const Color.fromARGB(255, 197, 90, 17);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark)
    );
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
        )
      ),
      title: 'Thidle',
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/login/signin': (context) => LoginScreen(),
        '/': (context) => App(),
        '/profile': (context) => Profile()
      },
    );
  }
}