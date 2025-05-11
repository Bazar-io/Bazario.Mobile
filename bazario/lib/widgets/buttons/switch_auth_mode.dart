import 'package:bazario/colors_and_borders.dart';
import 'package:flutter/material.dart';

class SwitchAuthMode extends StatelessWidget {
  const SwitchAuthMode({super.key, required this.isLogin, required this.onPressed});

  final bool isLogin;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          isLogin
              ? 'Nie posiadasz konta?'
              : 'Już posiadasz konto?',
          style: TextStyle(color: AppColors.brown.color),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            isLogin ? 'Załóż konto' : 'Zaloguj się',
            style: TextStyle(color: Color(0xFF7EBDC4)),
          ),
        ),
      ],
    );
  }
}
