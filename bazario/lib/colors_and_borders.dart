import 'package:flutter/material.dart';

enum AppColors { brown, lightBrown, validationErrorRed, blue }

enum AppBorders { textFormFieldBorder, leftFieldBorder, rightFieldBorder }

extension AppColorExtensions on AppColors {
  Color get color {
    switch (this) {
      case AppColors.brown:
        return const Color(0xFF443C3C);
      case AppColors.lightBrown:
        return const Color(0xFFD0C0C0);
      case AppColors.validationErrorRed:
        return const Color(0xFFFF8652);
        case AppColors.blue:
          return const Color(0xFF7EBDC4);
    }
  }
}

extension AppBorderExtensions on AppBorders {
  OutlineInputBorder get border {
    switch (this) {
      case AppBorders.textFormFieldBorder:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.brown.color),
        );
      case AppBorders.leftFieldBorder:
        return OutlineInputBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
          borderSide: BorderSide(color: AppColors.brown.color),
        );
      case AppBorders.rightFieldBorder:
        return OutlineInputBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          borderSide: BorderSide(color: AppColors.brown.color),
        );
    }
  }
}
