import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hih/UI/cartao.dart';
import 'package:provider/provider.dart';

import 'Login/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());

  var firesore = FirebaseFirestore.instance;
  firesore.collection("vacinas")
    .doc("vacina2")
    .set(
      {
        "nome":"CoronaVac",
        "doses":2,
        "imunizado":false
      }
    );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "app",
        home: LoginPage()
    );
  }
}

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = context.watch<User>();

    if (user != null) {
      return CardPage();
    }
    return LoginPage();
  }
}
