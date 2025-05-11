import 'package:bazario/colors_and_borders.dart';
import 'package:bazario/widgets/buttons/confirm_statute.dart';
import 'package:bazario/widgets/fields/confirm_password_field.dart';
import 'package:bazario/widgets/fields/email_field.dart';
import 'package:bazario/widgets/buttons/forgot_password_button.dart';
import 'package:bazario/widgets/buttons/login_button.dart';
import 'package:bazario/widgets/fields/name_and_surname_field.dart';
import 'package:bazario/widgets/fields/password_field.dart';
import 'package:bazario/widgets/fields/phone_number_field.dart';
import 'package:bazario/widgets/buttons/remember_me.dart';
import 'package:bazario/widgets/buttons/switch_auth_mode.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  var _rememberMe = false;
  final _loginFormKey = GlobalKey<FormState>();
  var _isLogin = true;
  var _isValidationError = false;
  String? _nameSurnameValidationError;
  var _confirmStatute = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPassController.dispose();
    _nameController.dispose();
    _surnameController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _loginFormKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  _isLogin ? 'Zaloguj się' : 'Zarejestruj się',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.brown.color,
                  ),
                ),
                const SizedBox(height: 20),
                EmailField(controller: _emailController, isLogin: _isLogin),
                const SizedBox(height: 25),
                PasswordField(
                  controller: _passwordController,
                  isLogin: _isLogin,
                ),
                if (!_isLogin)
                  Column(
                    children: [
                      const SizedBox(height: 25),
                      ConfirmPasswordField(controller: _confirmPassController),
                    ],
                  ),
                if (!_isLogin)
                  Column(
                    children: [
                      const SizedBox(height: 25),
                      NameAndSurnameField(
                        nameController: _nameController,
                        surnameController: _surnameController,
                      ),
                      if (_nameSurnameValidationError != null)
                        Text(
                          _nameSurnameValidationError!,
                          style: TextStyle(
                            color: AppColors.validationErrorRed.color,
                          ),
                        ),
                    ],
                  ),
                if (!_isLogin)
                  Column(
                    children: [
                      const SizedBox(height: 25),
                      PhoneNumberField(controller: _phoneNumberController),
                    ],
                  ),
                if (!_isLogin)
                  Column(
                    children: [
                      const SizedBox(height: 25),
                      ConfirmStatute(
                        confirmStatute: _confirmStatute,
                        onChanged: (value) {
                          setState(() {
                            _confirmStatute = !_confirmStatute;
                          });
                        },
                      ),
                    ],
                  ),
                const SizedBox(height: 15),
                if (_isLogin)
                  RememberMeCheckBox(
                    rememberMe: _rememberMe,
                    onChanged: (value) {
                      setState(() {
                        _rememberMe = !_rememberMe;
                      });
                    },
                  ),
                if (_isValidationError && _isLogin)
                  Text(
                    'Nieprawidłowy email lub hasło',
                    style: TextStyle(color: AppColors.validationErrorRed.color),
                  ),
                const SizedBox(height: 25),
                LoginButton(
                  onPressed: _submit,
                  text: _isLogin ? 'Zaloguj się' : 'Zarejestruj się',
                ),
                if (_isLogin)
                  ForgotPasswordButton(
                    onPressed: () {},
                    text: 'Nie pamiętasz hasła?',
                  ),
                SwitchAuthMode(isLogin: _isLogin, onPressed: resetFields),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submit() {
    setState(() {
      _nameSurnameValidationError = null;
    });

    final nameAndSurnameValidationResult = _validateNameAndSurname(
      _nameController.text.trim(),
      _surnameController.text.trim(),
    );
    if (nameAndSurnameValidationResult != null) {
      setState(() {
        _nameSurnameValidationError = nameAndSurnameValidationResult;
      });
    }
    setState(() {
      _isValidationError = !_loginFormKey.currentState!.validate();
    });
    if (!_loginFormKey.currentState!.validate()) {
      return;
    }
  }

  String? _validateNameAndSurname(String name, String surname) {
    final RegExp allowedChars = RegExp(r"^[\p{L}\-']+$", unicode: true);
    final isNameValid =
        name.isNotEmpty &&
        name.length >= 2 &&
        name.length <= 30 &&
        allowedChars.hasMatch(name);

    final isSurnameValid =
        surname.isNotEmpty &&
        surname.length >= 2 &&
        surname.length <= 30 &&
        allowedChars.hasMatch(surname);

    if (isNameValid && isSurnameValid) {
      return null;
    } else {
      return "Imię i nazwisko mogą zawierać tylko \n"
          "litery alfabetu oraz znaki ,-' i ', a ich \n"
          "długość musi wynosić od 2 do 30 \n"
          "znaków każde";
    }
  }

  void resetFields() {
    setState(() {
      _isLogin = !_isLogin;
      _isValidationError = false;
      _loginFormKey.currentState!.reset();
      _emailController.clear();
      _passwordController.clear();
      _confirmPassController.clear();
      _nameController.clear();
      _surnameController.clear();
    });
  }
}
