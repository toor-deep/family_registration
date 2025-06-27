import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled/core/logic/app_navigator.dart';
import 'package:untitled/features/auth/presentation/view/signup/sign_up_view.dart';

import 'home/home_page.dart';

class SplashScreen extends StatefulWidget {
  static const String path = '/splash';
  static const String name = 'splash_screen';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 300), _checkLoginState);
  }

  Future<void> _checkLoginState() async {
    await Future.delayed(const Duration(seconds: 2));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (isLoggedIn) {
      String? headId = prefs.getString('headId');
      context.pushNamed(HomeView.name,extra:  headId);
    } else {
      context.pushNamed(SignupView.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          'Welcome to My Family',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
