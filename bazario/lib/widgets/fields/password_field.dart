import 'package:bazario/colors_and_borders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    required this.controller,
    required this.isLogin,
  });

  final TextEditingController controller;
  final bool isLogin;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  var _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscureText,
      decoration: InputDecoration(
        labelText: 'Hasło',
        labelStyle: TextStyle(color: AppColors.brown.color),
        hintText: 'Napisz swoje hasło',
        hintStyle: TextStyle(color: AppColors.lightBrown.color),
        suffixIcon: IconButton(
          color: AppColors.brown.color,
          icon: SvgPicture.asset(
            _obscureText
                ? 'assets/icons/open_eye.svg'
                : 'assets/icons/closed_eye.svg',
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
        enabledBorder: AppBorders.textFormFieldBorder.border,
        errorStyle: TextStyle(color: AppColors.validationErrorRed.color),
        border: AppBorders.textFormFieldBorder.border,
        focusedBorder: AppBorders.textFormFieldBorder.border,
        errorBorder: AppBorders.textFormFieldBorder.border,
        focusedErrorBorder: AppBorders.textFormFieldBorder.border,
      ),
      style: TextStyle(color: AppColors.brown.color),
      validator: (password) {
        if (widget.isLogin) {
          if (password == null || password.isEmpty || password.length < 8) {
            return 'Hasło musi zawierać minimum 8 znaków';
          }
          if (password.length > 30) {
            return 'Hasło musi zawierać maximum 30 znaków';
          }
        } else {
          if (password == null ||
              password.isEmpty ||
              password.length < 6 ||
              password.length > 30) {
            return 'Hasło musi być od 8 do 30 symboli i \n'
                'zawierać minimum jedną wielką literę, \n'
                'jedną małą literę, jedną cyfrę i jeden \n'
                'symbol specjalny';
          }
        }
        return null;
      },
    );
  }
}
