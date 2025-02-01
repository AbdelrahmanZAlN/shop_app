import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/views/components/custom_elevated_button.dart';
import 'package:shop_app/views/components/custom_text_form_field.dart';
import 'package:shop_app/views/register/register_view.dart';

class LoginView extends StatelessWidget {
  static const String routeName = 'LoginView';
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height*0.2,
            ),
            Text(
              'LOGIN',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.009,
            ),
            Text(
              'login now to browse out hot offers',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.black38,
                fontWeight: FontWeight.w500
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.06,
            ),
            CustomTextFormField(
              onChange: (text){

              },
              hint: 'Email Address',
              preIconData: Icons.email_outlined,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.02,
            ),
            CustomTextFormField(
              onChange: (text){

              },
              hint: 'Password',
              preIconData: Icons.lock_outline,
              sufIconData: Icons.remove_red_eye_outlined,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.05,
            ),
            CustomElevatedButton(
              onPressed: (){

              },
              name: 'LOGIN',

            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                TextButton(
                  onPressed: (){
                    Navigator.pushReplacementNamed(context, RegisterScreen.routeName);
                  },
                  child: Text(
                    "Register",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: kDefaultColor,
                      fontWeight: FontWeight.w700
                    ),
                  ),)
              ],
            )

          ],
        ),
      ),
    );
  }
}
