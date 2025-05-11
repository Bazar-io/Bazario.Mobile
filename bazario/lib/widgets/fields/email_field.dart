import 'package:bazario/colors_and_borders.dart';
import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  const EmailField({super.key, required this.controller, required this.isLogin});

  final TextEditingController controller;
  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: 'Email',
        labelStyle: TextStyle(color: AppColors.brown.color),
        hintText: 'Napisz swój email',
        hintStyle: TextStyle(color: AppColors.lightBrown.color),
        enabledBorder: AppBorders.textFormFieldBorder.border,
        errorStyle: TextStyle(color: AppColors.validationErrorRed.color),
        border: AppBorders.textFormFieldBorder.border,
        focusedBorder: AppBorders.textFormFieldBorder.border,
        errorBorder: AppBorders.textFormFieldBorder.border,
        focusedErrorBorder: AppBorders.textFormFieldBorder.border,
      ),
      validator: (email) {
        if (email == null || email.isEmpty || email != 'test1@gmail.com') {
          return isLogin ? 'Adres email jest nieprawidłowy' : 'Wprowadź poprawny e-mail aby kontynuować';
        }
        return null;
      },
    );
  }
}
