import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


Widget MyTextFormField({
  TextEditingController? controller,
  TextInputType? keyboardType = TextInputType.text,
 required String label ,
  String? hint,

  bool obscure = false,
  bool filled = false,
  Function? onTap,

  Function? onsubmitted,
  Function? suffixFunction,
  String? Function(String?)? validator,
  Function? data,
  IconData? prefixIcon,
  IconData? suffixIcon,
  Color? labelColor,
  Color? prefixColor,
  Color? suffixColor,
  Color? borderColor= Colors.grey,
  double borderRadius=10,
  double? maxWidth=double.infinity,
  double? maxHeight=60,


}) =>
    Padding(
      padding: EdgeInsetsDirectional.only(bottom: 10),
      child: TextFormField(

        controller: controller,
        style: const TextStyle(
          color: Colors.purple,
        ),
        keyboardType: keyboardType,
        validator: validator,
        obscureText: obscure,
        onTap: () {
          onTap!();
        },
        onFieldSubmitted: (value) {
          onsubmitted!();
        },
        decoration: InputDecoration(

          constraints: BoxConstraints(
            maxHeight: maxHeight!,
            maxWidth: maxWidth!,
          ),
          prefixIcon: Icon(
            prefixIcon,
            color: prefixColor,
          ),
          suffixIcon: suffixIcon != null
              ? IconButton(
              onPressed: () {
                suffixFunction!();
              },
              icon: Icon(
                suffixIcon,
                color: suffixColor,
              ))
              : null,
          label:Text(label),
          hintText: hint,
          filled: filled,

          enabledBorder: OutlineInputBorder(

            borderSide: BorderSide(
              color:borderColor!,
            ),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.purple,
            ),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
            ),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
    );
