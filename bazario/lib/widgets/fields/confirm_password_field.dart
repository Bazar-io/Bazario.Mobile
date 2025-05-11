import 'package:bazario/colors_and_borders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ConfirmPasswordField extends StatefulWidget {
  const ConfirmPasswordField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  State<ConfirmPasswordField> createState() => _ConfirmPasswordFieldState();
}

class _ConfirmPasswordFieldState extends State<ConfirmPasswordField> {
  var _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscureText,
      decoration: InputDecoration(
        labelText: 'Powtórz hasło',
        labelStyle: TextStyle(color: AppColors.brown.color),
        hintText: 'Powtórz swoje hasło',
        hintStyle: TextStyle(color: AppColors.lightBrown.color),
        suffixIcon: IconButton(
          icon: SvgPicture.asset(
            _obscureText ? 'assets/icons/open_eye.svg' : 'assets/icons/closed_eye.svg',
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
        if (password == null || password.isEmpty) {
          return 'Podaj swoje hasło';
        }
        if (password.length < 8) {
          return 'Hasło musi zawierać od 8 do 30 symboli '
              'i zawierać minimum jedną wielką literę, jedną '
              'małą literę, jedną cyfrę i jeden symbol specjalny';
        }
        return null;
      },
    );
  }
}
