import 'package:bazario/colors_and_borders.dart';
import 'package:flutter/material.dart';

class ConfirmStatute extends StatelessWidget {
  const ConfirmStatute({
    super.key,
    required this.confirmStatute,
    required this.onChanged,
  });

  final bool confirmStatute;
  final ValueChanged<bool?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: confirmStatute,
          checkColor: Colors.brown,
          activeColor: Colors.transparent,
          onChanged: onChanged,
        ),
        RichText(
          text: TextSpan(
            style: TextStyle(fontSize: 16, color: AppColors.brown.color),
            children: [
              TextSpan(text: 'Rejestrując się, potwierdzam, \nże akceptuję '),
              TextSpan(style: TextStyle(color: AppColors.blue.color), text: 'Regulamin \nBazar.io '),
              TextSpan(text: ', zapoznałam/em się z\n'),
              TextSpan(style: TextStyle(color: AppColors.blue.color), text: 'Polityką Prywatności '),
              TextSpan(text: 'i mam \npowyżej 18 lat.'),
            ],
          ),
        ),
      ],
    );
  }
}
