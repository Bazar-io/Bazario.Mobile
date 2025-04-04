import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Bazar.io',
            textAlign: TextAlign.center,
            style: GoogleFonts.vibur(
              textStyle: Theme.of(context).textTheme.titleMedium,
              fontSize: 60,
              color: Colors.white,
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF7EBDC4), Color(0xFFDFF1D7)],
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Center(
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.8,
                  maxHeight: MediaQuery.of(context).size.height * 0.8,
                ),
                child: LoginScreen(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
