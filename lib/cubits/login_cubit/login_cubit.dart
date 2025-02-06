import 'package:shop_app/service/api/api_service.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/cubits/login_cubit/login_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/login_model.dart';

class LoginCubit extends Cubit<LoginStates>{
  LoginCubit() : super(LoginInitialState());
  static LoginCubit get(context) => BlocProvider.of(context);

  Future<void> userLogin ({
    required String email,
    required String password,}) async{
    emit(LoginLoadingState());
    
    // ApiService().post(url: kLogin,
    //     body: {
    //       "email": email,
    //       "password": password,
    //     },
    //     token: null
    // ).then((value){
    //       debugPrint(value.toString());
    //       emit(LoginSuccessState());
    // }).catchError((e){
    //   debugPrint(e.toString());
    //   emit(LoginFailureState(e.toString()));
    // });
    
    // try{
    //   var response = await ApiService().post(
    //     url: kLogin,
    //     body: {
    //       "email": email,
    //       "password": password,
    //     },
    //     token: null,
    //   );
    //   emit(LoginSuccessState(
    //     LoginModel.fromJson(response['data'])
    //   ));
    // }catch (e){
    //   emit(LoginFailureState(e.toString()));
    // }

    try {
      var response = await ApiService().post(
        url: kLogin,
        body: {
          "email": email,
          "password": password,
        },
        token: null,
      );


      if (response == null) {
        emit(LoginFailureState("No response from server"));
      } else if (response is! Map<String, dynamic>) {
        emit(LoginFailureState("Unexpected response format"));
      } else {
        emit(LoginSuccessState(LoginModel.fromJson(response)));
      }

    } catch (e) {
      emit(LoginFailureState(e.toString()));
    }


  }
}