import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/my_theme_data.dart';
import 'package:shop_app/views/home/home_view.dart';
import 'package:shop_app/views/login/login_view.dart';
import 'package:shop_app/views/register/register_view.dart';

import 'simple_bloc_observer.dart';
import 'views/onboarding/onboarding_view.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
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
        RegisterView.routeName : (_) => const RegisterView(),
      },
    );
  }
}
