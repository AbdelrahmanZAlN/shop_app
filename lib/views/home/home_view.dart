import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/service/local/cache_helper.dart';
import 'package:shop_app/views/components/custom_elevated_button.dart';
import 'package:shop_app/views/login/login_view.dart';

class HomeView extends StatefulWidget {
  static const String routeName= 'HomeView' ;
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<Widget> tabs = [

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index){

          },
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

      body: Column(
        children: [
          CustomElevatedButton(
              onPressed: (){
                logout(context);
              },
              name: "Logout")
        ],
      ),
    );
  }

  void logout (context){
    CacheHelper.saveData(key: kUserToken, value: null);
    Navigator.pushReplacementNamed(context, LoginView.routeName);
  }
}
