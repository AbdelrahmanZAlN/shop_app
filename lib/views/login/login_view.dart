import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/cubits/login_cubit/login_cubit.dart';
import 'package:shop_app/cubits/login_cubit/login_states.dart';
import 'package:shop_app/cubits/password_visibility_cubit/password_visibility_cubit.dart';
import 'package:shop_app/cubits/password_visibility_cubit/password_visibility_states.dart';
import 'package:shop_app/dialog_utils.dart';
import 'package:shop_app/views/components/custom_elevated_button.dart';
import 'package:shop_app/views/components/custom_text_form_field.dart';
import 'package:shop_app/views/register/register_view.dart';


class LoginView extends StatefulWidget {
  static const String routeName = 'LoginView';
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final formKey = GlobalKey<FormState>();
  String? email, password;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:[
        BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(),
        ),
        BlocProvider<PasswordVisibilityCubit>(
          create: (context) => PasswordVisibilityCubit(),
        )
      ] ,
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if(state is LoginSuccessState){
            if(state.response.status){
              debugPrint(state.response.message);
              DialogUtils.showToast(context,state.response.message);
            }
            else{
              debugPrint(state.response.message);
              DialogUtils.showToast(context,state.response.message);
            }
          }
          else if (state is LoginFailureState){
            debugPrint(state.errorMessage);
            DialogUtils.showToast(context,state.errorMessage);

          }

        },
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(25),
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                      Text(
                        'LOGIN',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.009),
                      Text(
                        'Login now to browse our hot offers',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.black38, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                      CustomTextFormField(
                        onChange: (text) => email = text,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Email is required';
                          } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                              .hasMatch(text)) {
                            return 'Enter a valid email address';
                          }
                          return null;
                        },
                        hint: 'Email Address',
                        preIconData: Icons.email_outlined,
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.02),


                      BlocBuilder<PasswordVisibilityCubit, PasswordVisibilityStates>(
                        builder: (context, state) {
                          var cubit = context.watch<PasswordVisibilityCubit>(); // Get the cubit

                          return CustomTextFormField(
                            onChange: (text) => password = text,
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return 'Password is required';
                              } else if (text.length < 6) {
                                return 'Password must be at least 6 characters long';
                              }
                              return null;
                            },
                            hint: 'Password',
                            preIconData: Icons.lock_outline,
                            isPassword: !cubit.isVisible, // ✅ Hide/show password
                            sufIconData: cubit.iconData, // ✅ Use cubit state for icon
                            suffixOnPressed: () {
                              cubit.changePasswordVisibility(); // ✅ Toggle visibility on click
                            },
                          );
                        },
                      ),


                      // BlocBuilder<PasswordVisibilityCubit, PasswordVisibilityStates>(
                      //   builder: (context, state) {
                      //
                      //     return CustomTextFormField(
                      //       onChange: (text) => password = text,
                      //       validator: (text) {
                      //         if (text == null || text.isEmpty) {
                      //           return 'Password is required';
                      //         } else if (text.length < 6) {
                      //           return 'Password must be at least 6 characters long';
                      //         }
                      //         return null;
                      //       },
                      //       hint: 'Password',
                      //       preIconData: Icons.lock_outline,
                      //       isPassword:  ,
                      //       sufIconData: ,
                      //     );}),


    // CustomTextFormField(
                      //   onChange: (text) => password = text,
                      //   validator: (text) {
                      //     if (text == null || text.isEmpty) {
                      //       return 'Password is required';
                      //     } else if (text.length < 6) {
                      //       return 'Password must be at least 6 characters long';
                      //     }
                      //     return null;
                      //   },
                      //   hint: 'Password',
                      //   preIconData: Icons.lock_outline,
                      //     isPassword:  PasswordVisibilityCubit().isVisible,
                      //   sufIconData: PasswordVisibilityCubit().iconData
                      //   // obscureText: isPasswordHidden,
                      //   // suffixOnPressed: () {
                      //   //   setState(() {
                      //   //     isPasswordHidden = !isPasswordHidden;
                      //   //   });
                      //   // },
                      // ),


                      SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                      ConditionalBuilder(
                        condition: state is! LoginLoadingState,
                        builder: (context) => CustomElevatedButton(
                          onPressed: (){
                            if (formKey.currentState!.validate()) {
                              BlocProvider.of<LoginCubit>(context).userLogin(
                                email: email!,
                                password: password!,
                              );
                            }
                          },
                          name: 'LOGIN',
                        ),
                        fallback: (context) =>
                        const Center(child: CircularProgressIndicator()),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, RegisterView.routeName);
                            },
                            child: Text(
                              "Register",
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: kDefaultColor,
                                  fontWeight: FontWeight.w700),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void login() {
    if (formKey.currentState!.validate()) {
      BlocProvider.of<LoginCubit>(context).userLogin(
        email: email!,
        password: password!,
      );
    }
  }
}
