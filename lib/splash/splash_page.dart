import 'package:flutter/material.dart';
import 'package:startup_namer/core/app_colors.dart';
import 'package:startup_namer/pages/home/home_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2))
        .then((_) => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            ));
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: AppColors.blue,
        ),
        child: const Center(
          child: Icon(
            Icons.engineering,
            color: AppColors.white,
            size: 150,
          ),
        ),
      ),
    );
  }
}
