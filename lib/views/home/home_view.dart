import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/cubits/home_cubit/home_cubit.dart';
import 'package:shop_app/cubits/home_cubit/home_states.dart';
import 'package:shop_app/service/local/cache_helper.dart';
import 'package:shop_app/views/home/categories_tab/categories_tab.dart';
import 'package:shop_app/views/home/favourite_tab/favourite_tab.dart';
import 'package:shop_app/views/home/home_tab/home_tab.dart';
import 'package:shop_app/views/home/settings_tab/settings_tab.dart';
import 'package:shop_app/views/login/login_view.dart';

class HomeView extends StatefulWidget {
  static const String routeName = 'HomeView';

  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var currentIndex = 0;
  final List<Widget> tabs = const [
    HomeTab(),
    CategoriesTab(),
    FavouriteTab(),
    SettingsTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
                onTap: (index) {
                  currentIndex = index;
                },
                type: BottomNavigationBarType.fixed,
                unselectedItemColor: Colors.grey,
                showUnselectedLabels: true,
                currentIndex: currentIndex,
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: "Home"
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.apps),
                      label: "Categories"
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.favorite),
                      label: "Favourite"
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings),
                      label: "Settings"
                  ),
                ]),

            body: tabs[currentIndex]
        );
      },
    );
  }

  void logout(context) {
    CacheHelper.saveData(key: kUserToken, value: null);
    Navigator.pushReplacementNamed(context, LoginView.routeName);
  }
}
