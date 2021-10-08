import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class sing_in_page extends StatefulWidget {
  @override
  _sing_in_pageState createState() => _sing_in_pageState();
}

class _sing_in_pageState extends State<sing_in_page> {

  final maskCpf = MaskTextInputFormatter(
      mask: "###.###.###-##", filter: {"#": RegExp(r'[0-9]')});
  final _cpfController = TextEditingController();
  final _senhaController = TextEditingController();
  final _nomeCointroller = TextEditingController();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Center(
        child: SingleChildScrollView(
          child:  Container(
            color: Colors.white,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image(image: AssetImage('assets/images/logo/logo3.png')),
                  Padding(
                    padding: EdgeInsets.only(left: 40.0, right: 40.0, top: 40.0),
                    child: TextField(
                      controller: _cpfController,
                      decoration: InputDecoration(
                        labelText: 'CPF',
                        border: OutlineInputBorder(),
                      ),
                      inputFormatters: [maskCpf],
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Padding(
                    padding:EdgeInsets.only(left: 40.0, right: 40.0, top: 20.0),
                    child: TextField(
                      controller: _nomeCointroller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Nome',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 40.0, right: 40.0,top: 20.0),
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  Padding(
                    padding:EdgeInsets.only(left: 40.0, right: 40.0, top: 20.0),
                    child: TextField(
                      controller: _senhaController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Senha',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 40.0, right: 40.0, top: 20.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50),
                      ),
                      onPressed: () async {
                        // try {
                        //   await Firebase.initializeApp();
                        //   UserCredential user =
                        //       await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        //           email: _emailController.text,
                        //           password: _senhaController.text
                        //       );
                        //   print(user);
                        //   User? updateUser = FirebaseAuth.instance.currentUser;
                        //   updateUser!.updateProfile(displayName: _nomeCointroller.text);
                        //   userSetup(_nomeCointroller.text);
                        //   Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                        //
                        // } on FirebaseAuthException catch (e) {
                        //   if (e.code == 'weak-password') {
                        //     print('A senha é muito fraca ');
                        //   }else if (e.code == 'Email ja esta sendo utilizado') {
                        //     print('A conta ja existe nesse email.');
                        //   }
                        // }catch (e) {
                        //   print(e.toString());
                        // }
                      },
                      child: Text("Entrar"),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}
