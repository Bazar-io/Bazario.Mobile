import 'package:bazario/colors_and_borders.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PhoneNumberField extends StatefulWidget {
  const PhoneNumberField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  State<PhoneNumberField> createState() => _PhoneNumberFieldState();
}

class _PhoneNumberFieldState extends State<PhoneNumberField> {
  String initialCountry = 'PL';
  PhoneNumber number = PhoneNumber(isoCode: 'PL');
  bool _isValid = false;


  @override
  Widget build(BuildContext context) {
    return InternationalPhoneNumberInput(
      onInputChanged: (PhoneNumber number) {
        this.number = number;
      },
      onInputValidated: (bool value){
        setState(() {
          _isValid = value;
        });
      },
      selectorConfig: SelectorConfig(
        selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
        showFlags: true,
        leadingPadding: 10,
        trailingSpace: false,
      ),
      ignoreBlank: false,
      autoValidateMode: AutovalidateMode.onUserInteraction,
      selectorTextStyle: TextStyle(color: Colors.black),
      initialValue: number,
      textFieldController: widget.controller,
      formatInput: true,
      keyboardType: TextInputType.phone,
      inputDecoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
        labelText: 'Numer telefonu',
        labelStyle: TextStyle(color: AppColors.brown.color),
        hintText: '123-456-789',
        hintStyle: TextStyle(color: AppColors.lightBrown.color),
        errorStyle: TextStyle(color: AppColors.validationErrorRed.color),
        enabledBorder: AppBorders.textFormFieldBorder.border,
        border: AppBorders.textFormFieldBorder.border,
        focusedBorder: AppBorders.textFormFieldBorder.border,
        errorBorder: AppBorders.textFormFieldBorder.border,
        focusedErrorBorder: AppBorders.textFormFieldBorder.border,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Nieprawidłowy numer telefonu';
        }
        if (!_isValid) {
          return 'Nieprawidłowy numer telefonu';
        }
        return null;
      },
    );
  }
}
