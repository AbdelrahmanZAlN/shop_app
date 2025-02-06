import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/cubits/home_cubit/home_cubit.dart';
import 'package:shop_app/my_theme_data.dart';
import 'package:shop_app/service/local/cache_helper.dart';
import 'package:shop_app/views/home/home_view.dart';
import 'package:shop_app/views/login/login_view.dart';
import 'package:shop_app/views/register/register_view.dart';

import 'simple_bloc_observer.dart';
import 'views/onboarding/onboarding_view.dart';

void main() async{
  Bloc.observer = SimpleBlocObserver();
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter is initialized
  await CacheHelper.init(); // Initialize CacheHelper
  bool showOnboarding = CacheHelper.getData(key: kIsOnboarding) ?? true;
  String? isLoggedIn = CacheHelper.getData(key: kUserToken);
  debugPrint(isLoggedIn);
  debugPrint("$showOnboarding");
  String initialRouteName;
  if (!showOnboarding) {
    if(isLoggedIn!=null ) {
      initialRouteName = HomeView.routeName;
    } else {
      initialRouteName = LoginView.routeName;
    }
  } else {
    initialRouteName =  OnboardingView.routeName;
  }

  runApp(MyApp(initialRouteName: initialRouteName));
}

class MyApp extends StatelessWidget {
  final String initialRouteName;
  const MyApp({
    super.key,
    required this.initialRouteName,
  });

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(
          create: (context) => HomeCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: MyThemeData.lightTheme,
        initialRoute: initialRouteName,
        routes:{
          OnboardingView.routeName : (_)=> const OnboardingView(),
          HomeView.routeName : (_)=> const HomeView(),
          LoginView.routeName : (_)=> const LoginView(),
          RegisterView.routeName : (_) => const RegisterView(),
        },
      ),
    );
  }
}
