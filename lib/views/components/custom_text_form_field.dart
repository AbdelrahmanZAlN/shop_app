import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';

class CustomTextFormField extends StatefulWidget {
  final String hint;
  final Function(String) onChange;
  final IconData? preIconData;
  final IconData? sufIconData;
  const CustomTextFormField({super.key,
    required this.onChange,
    required this.hint,
    this.preIconData,
    this.sufIconData,
});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        color: Colors.white
      ),
      validator: (text){
        if(text?.isEmpty==true){
          return 'required field';
        }
        else{
          return null;
        }
      },
      onChanged: widget.onChange,
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: Colors.black54,
          fontWeight: FontWeight.w500
        ),
        prefixIcon: Icon(widget.preIconData,size: 26,),
        suffixIcon: Icon(widget.sufIconData,size: 26,),
        border: const OutlineInputBorder(
          // borderSide: BorderSide(color: Colors.white)
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: kDefaultColor)
        ),
        enabledBorder:  const OutlineInputBorder(
            // borderSide: BorderSide(color: Colors.white)
        )
      ),
    );
  }
}
