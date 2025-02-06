import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubits/home_cubit/home_states.dart';

class HomeCubit extends Cubit<HomeStates>{
  HomeCubit() : super(HomeInitialState());
  var currentIndex = 0;
  void changeTab (){

    emit(HomeChangeTabState());
  }
  void getData (){

  }
}