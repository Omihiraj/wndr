import 'dart:async';
import 'package:flutter/material.dart';
import 'views/pages/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();

    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: ((context) => const LoginPage()))));
  }

  Padding mainImage() {
    return Padding(
      padding: const EdgeInsets.only(top: 120, left: 50, right: 50),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/4.jpg'),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          mainImage(),
        ],
      ),
    );
  }
}
