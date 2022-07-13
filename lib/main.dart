import 'package:flutter/material.dart';
import 'package:startup_namer/pages/favorites_state.dart';
import 'package:startup_namer/splash/splash_page.dart';

void main() {
  runApp(
    FavoritesState.provider,
  );
}

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue.shade900,
          foregroundColor: Colors.white,
        ),
      ),
      home: const SplashPage(),
    );
  }
}
