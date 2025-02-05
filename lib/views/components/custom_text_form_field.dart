import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';

class CustomTextFormField extends StatefulWidget {
  final String hint;
  final bool isPassword;
  final Function(String) onChange;
  final Function()? suffixOnPressed;
  final IconData? preIconData;
  final IconData? sufIconData;
  final String? Function(String?)? validator;
  const CustomTextFormField({super.key,
    required this.onChange,
    required this.hint,
    this.validator,
    this.suffixOnPressed,
    this.isPassword=false,
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
        color: Colors.black,
        fontSize: 18
      ),
      validator: (text){
        if (text == null || text.isEmpty) {
          return 'Required field';
        }
        if (widget.validator != null) {
          return widget.validator!(text);
        }
        return null;
      },
      onChanged: widget.onChange,
      obscureText: widget.isPassword ,
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: Colors.black54,
          fontWeight: FontWeight.w500
        ),
        prefixIcon: Icon(widget.preIconData,size: 26,),
        suffixIcon: widget.sufIconData != null
            ? IconButton(
              icon: Icon(widget.sufIconData, size: 26),
            onPressed: widget.suffixOnPressed,
            )
            : null,

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
