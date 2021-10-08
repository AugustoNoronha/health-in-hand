import 'package:firebase_auth/firebase_auth.dart';


class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;
  AuthService();

  login(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Future<String> singUp(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
          
      return "Logado";
    } catch (e) {
      return e.toString();
    }
  }
}
