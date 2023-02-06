import 'package:flutter/material.dart';
import 'package:thidle/app.dart';

void main() {
  runApp(const Thidle());
}

class Thidle extends StatelessWidget {
  const Thidle({super.key});
  
  static Color defaultColor = const Color.fromARGB(255, 197, 90, 17);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
        )
      ),
        title: 'Thidle',
        home: const App(),
    );
  }
}