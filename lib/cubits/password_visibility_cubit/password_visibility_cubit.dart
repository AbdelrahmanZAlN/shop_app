import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubits/password_visibility_cubit/password_visibility_states.dart';

class PasswordVisibilityCubit extends Cubit<PasswordVisibilityStates> {
    PasswordVisibilityCubit() : super(PasswordVisibilityInitialState());
    bool isVisible = false;
    var iconData = Icons.visibility_off_outlined ;
    void changePasswordVisibility (){
      isVisible =!isVisible ;
      iconData = isVisible ? Icons.visibility_outlined : Icons.visibility_off_outlined;
      emit(PasswordVisibilitySuccessState());
    }
}