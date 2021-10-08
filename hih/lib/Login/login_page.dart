import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hih/Login/login-controller.dart';
import 'package:hih/UI/cartao.dart';
import '../UI/sing_in.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final maskCpf = MaskTextInputFormatter(
      mask: "###.###.###-##", filter: {"#": RegExp(r'[0-9]')});
  final _cpfController = TextEditingController();
  final _senhaController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image(image: AssetImage('assets/images/logo/logo3.png')),
                  Padding(
                    padding: EdgeInsets.all(40.0),
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.only(left: 40.0, right: 40.0, top: 40.0),
                  //   child: TextField(
                  //     controller: _cpfController,
                  //     decoration: InputDecoration(
                  //       labelText: 'CPF',
                  //       border: OutlineInputBorder(),
                  //     ),
                  //     inputFormatters: [maskCpf],
                  //     keyboardType: TextInputType.number,
                  //   ),
                  // ),
                  Padding(
                    padding: EdgeInsets.all(40.0),
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
                    padding: EdgeInsets.only(left: 40.0, right: 40.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50),
                      ),
                      onPressed: () {
                        print("fui Clicado onpressed");
                        LoginController()
                            .loginEmail(_emailController, _senhaController);
                             Navigator.push(context, MaterialPageRoute(builder: (context) => CardPage()));
                      },
                      child: Text("Entrar"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 40.0, right: 40.0),
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => sing_in_page()));
                      },
                      child: Text(
                        "Cadastrar",
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
