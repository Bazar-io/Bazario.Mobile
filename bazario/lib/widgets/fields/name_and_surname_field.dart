import 'package:bazario/colors_and_borders.dart';
import 'package:flutter/material.dart';

class NameAndSurnameField extends StatelessWidget {
  const NameAndSurnameField({
    super.key,
    required this.nameController,
    required this.surnameController,
    this.validator,
  });

  final TextEditingController nameController;
  final TextEditingController surnameController;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: nameController,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              labelText: 'Imię',
              labelStyle: TextStyle(color: AppColors.brown.color),
              hintText: 'Napisz imię',
              hintStyle: TextStyle(color: AppColors.lightBrown.color),
              enabledBorder: AppBorders.leftFieldBorder.border,
              errorStyle: TextStyle(height: 0, fontSize: 0),
              border: AppBorders.leftFieldBorder.border,
              focusedBorder: AppBorders.leftFieldBorder.border,
              errorBorder: AppBorders.leftFieldBorder.border,
              focusedErrorBorder: AppBorders.leftFieldBorder.border,
            ),
          ),
        ),
        SizedBox(
          width: 1,
          height: 58,
          child: DecoratedBox(
            decoration: BoxDecoration(color: AppColors.brown.color),
          ),
        ),
        Expanded(
          child: TextFormField(
            controller: surnameController,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              labelText: 'Nazwisko',
              labelStyle: TextStyle(color: AppColors.brown.color),
              hintText: 'oraz nazwisko',
              hintStyle: TextStyle(color: AppColors.lightBrown.color),
              enabledBorder: AppBorders.rightFieldBorder.border,
              errorStyle: TextStyle(height: 0, fontSize: 0),
              border: AppBorders.rightFieldBorder.border,
              focusedBorder: AppBorders.rightFieldBorder.border,
              errorBorder: AppBorders.rightFieldBorder.border,
              focusedErrorBorder: AppBorders.rightFieldBorder.border,
            ),
          ),
        ),
      ],
    );
  }
}
