import 'package:shop_app/models/login_model.dart';

class LoginStates {}

class LoginInitialState extends LoginStates {}
class LoginSuccessState extends LoginStates {
  final LoginModel response;
  LoginSuccessState(this.response);
}
class LoginLoadingState extends LoginStates {}
class LoginFailureState extends LoginStates {
  final String errorMessage;
  LoginFailureState(this.errorMessage);
}