import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/views/login/login_view.dart';
import 'package:shop_app/views/onboarding/first_tab.dart';
import 'package:shop_app/views/onboarding/second_tab.dart';
import 'package:shop_app/views/onboarding/third_tab.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatefulWidget {
  static const String routeName = 'OnboardingView';

  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final pageController = PageController();
  var isLast = false;
  final List<Widget> pageTabs = [
    const FirstTab(),
    const SecondTab(),
    const ThirdTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: TextButton(
                onPressed: (){
                  Navigator.pushReplacementNamed(context, LoginView.routeName);
                },
                  child: const Text(
                    'Skip',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: kDefaultColor
                    ),

                  )
              ),
            ),
            Expanded(
              child: PageView.builder(
                itemBuilder: (context, index){
                  if(index==pageTabs.length-1){
                    isLast=true;
                  }
                  else{
                    isLast=false;
                  }
                  return pageTabs[index];
                },
                controller: pageController,
                itemCount: pageTabs.length,
              
              ),
            ),

            SizedBox(height: MediaQuery.of(context).size.height*0.07,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmoothPageIndicator(
                  effect: const ExpandingDotsEffect(
                    dotWidth: 12,
                    dotHeight: 12,
                    spacing: 5,
                    expansionFactor: 4,
                    activeDotColor: kDefaultColor
                  ),
                    controller: pageController,
                    count: pageTabs.length),
                FloatingActionButton(
                  shape: const CircleBorder(),
                  onPressed: (){
                    if(isLast){
                      Navigator.pushReplacementNamed(context, LoginView.routeName);
                      return;
                    }
                    pageController.nextPage(
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.fastEaseInToSlowEaseOut,
                    );

                  },
                  child: const Icon(Icons.arrow_forward_ios),

                )
              ],
            )

          ],
        ),
      ),
    );
  }
}
