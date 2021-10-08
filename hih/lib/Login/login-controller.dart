import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hih/Services/auth_services.dart';
import 'package:hih/UI/cartao.dart';

class LoginController {

  final auth = AuthService();

  loginEmail(TextEditingController email, TextEditingController password) async {
    print("entrei em loginEmail");
    await auth.login(email.text, password.text);
  
  }

}