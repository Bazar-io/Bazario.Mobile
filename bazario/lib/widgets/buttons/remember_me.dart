import 'package:bazario/colors_and_borders.dart';
import 'package:flutter/material.dart';

class RememberMeCheckBox extends StatelessWidget {
  const RememberMeCheckBox({
    super.key,
    required this.rememberMe,
    required this.onChanged,
  });

  final bool rememberMe;
  final ValueChanged<bool?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Zapamiętaj mnie',
          style: TextStyle(fontSize: 16, color: AppColors.brown.color),
        ),
        Checkbox(
          value: rememberMe,
          checkColor: Colors.brown,
          activeColor: Colors.transparent,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
