import 'package:flutter/material.dart';
import 'package:shop_app/my_theme_data.dart';
import 'package:shop_app/views/home/home_view.dart';
import 'package:shop_app/views/login/login_view.dart';
import 'package:shop_app/views/register/register_view.dart';

import 'views/onboarding/onboarding_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.lightTheme,
      initialRoute: OnboardingView.routeName,
      routes:{
        OnboardingView.routeName : (_)=> const OnboardingView(),
        HomeView.routeName : (_)=> const HomeView(),
        LoginView.routeName : (_)=> const LoginView(),
        RegisterScreen.routeName : (_) => const RegisterScreen(),
      },
    );
  }
}
