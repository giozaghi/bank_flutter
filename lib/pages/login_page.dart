

import 'package:bank_flutter/controller/user_controller.dart';
import 'package:bank_flutter/helpers/sharedPrefs/sharedPrefs_helper.dart';
import 'package:bank_flutter/modules/user/userToken_module.dart';

import 'package:flutter/material.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _email = new TextEditingController();
  final _pass = new TextEditingController();
  bool _validateEmail = false;
  bool _validateSenha = false;
  bool obscure = true;
  SharedPref sharedPref = SharedPref();
  UserToken token = UserToken();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login'),),
      body: _body(context),
    );
  }
  _body(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: new OutlineInputBorder(
                    borderSide: new BorderSide(),
                  ),
                  labelText: 'Email',
                  hintText: 'Email',
                  errorText: _validateEmail ? 'Digite um email' : null,

                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _pass,
                obscureText: obscure,
                decoration: InputDecoration(
                  border: new OutlineInputBorder(
                    borderSide: new BorderSide(),
                  ),
                  suffixIcon: IconButton(
                      alignment: Alignment.bottomLeft,
                      icon: Icon(Icons.remove_red_eye),
                      onPressed: () {
                        setState(() {
                          obscure == true ? obscure = false : obscure =
                          true;
                        });
                      }),
                  labelText: 'Senha',
                  hintText: 'Senha',
                  errorText: _validateSenha ? 'Digite uma senha' : null,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                child: Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width / 1.2,
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.white)),
                      textColor: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Text('ENTRAR',
                          style: TextStyle(fontSize: 20),),
                      ),
                      color: Colors.lightBlueAccent,
                      onPressed: () {
                        _login();

                      }
                  ),

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void displayDialog(context, title, text) => showDialog(
    context: context,
    builder: (context) =>
        AlertDialog(
            title: Text(title),
            content: Text(text)
        ),
  );

  void _login() async{
    //Future<UserToken> future = await UserController.login(_email.text,_pass.text);
    UserToken t = await UserController.login(_email.text,_pass.text);

    /*future.then((t) => {

    });*/

    sharedPref.save("token", t.token);
    print('res : ${t.token}');

    t.token != null ? Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) =>
    HomePage())
    ) : displayDialog(context, "Error", "Dados incorretos!!");

  }
}
