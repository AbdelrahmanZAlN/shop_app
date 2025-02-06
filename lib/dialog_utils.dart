import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DialogUtils{

  static void showMessage(BuildContext context, String message,{
    String? posActionName,
    VoidCallback? posAction,
    String? negActionName,
    VoidCallback? negAction,
    bool barrierDismissible= true
  }){
    List<Widget> actions=[];
    if(posActionName!=null){
      actions.add(TextButton(onPressed:(){
        hideDialog(context);
        posAction?.call();
      }
          , child: Text(posActionName)));
    }
    if(negActionName!=null){
      actions.add(TextButton(onPressed:(){
        hideDialog(context);
        negAction?.call();
      }
          , child: Text(negActionName)));
    }
    showDialog(context: context,
        builder: (buildContext){
          return AlertDialog(
            content: Text(message),
            actions: actions,

          );




        },barrierDismissible: barrierDismissible);
  }


  static void showSnackBar(BuildContext context, String msg){

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));

  }

  static void hideDialog (BuildContext context){
    Navigator.pop(context);
  }

  static void showToast ({
    required BuildContext context,
    required String message,
    Toast toastLength = Toast.LENGTH_SHORT
  }){
    Fluttertoast.showToast(
        msg: message,
        toastLength: toastLength
    );
  }


  static void showLongToast(BuildContext context, String message) {
    FToast fToast = FToast();
    fToast.init(context);

    Widget customToast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
      margin: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.black87,
      ),
      child: Text(
        message,
        style: const TextStyle(color: Colors.white, fontSize: 16),
        textAlign: TextAlign.center,
      ),
    );

    fToast.showToast(
      child: customToast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 5),
    );
  }

}