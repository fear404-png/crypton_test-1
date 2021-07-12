import 'package:crypton_test/theme/app_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppColors.loginBackgroundGradientDecoration,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Login",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          ),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        backgroundColor: Colors.transparent,
        body: _FormWidget(),
      ),
    );
  }
}

class _FormWidget extends StatefulWidget {
  const _FormWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<_FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<_FormWidget> {
  bool _isObscure = true;

  final _loginController = TextEditingController(text: "");
  final _passwordController = TextEditingController(text: "");
  void _auth() {
    final _login = _loginController.text;
    final _password = _passwordController.text;
    if (_login == "[a-zA-Z\_]" && _password == "admin") {
//логика
      Navigator.of(context).pushReplacementNamed("/main_screen");
    } else {

    }
    setState(() {});



    //вот тут нужна логика

    //переключение на следующий экран
    Navigator.of(context).pushReplacementNamed("/main_screen");
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 330,
        height: 420,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 35),
          child: Column(

            children:[
              TextField(
                  controller: _loginController,
                  decoration: InputDecoration(
                      labelText: "NickName",
                      labelStyle: TextStyle(fontSize: 12))),


              TextField(
                obscureText: _isObscure,
                decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(fontSize: 12),
                    suffixIcon: IconButton(
                        icon: Icon(_isObscure
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          print("tap");
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        })),
              ),
              SizedBox(height: 45),
              TextButton(
                  onPressed: () {
                    _auth();
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: AppColors.loginBackgroundGradientDecoration,
                    child: Center(
                        child: Text(
                          "Sing in",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        )),
                  )),
              SizedBox(height: 30),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Регистрируясь вы принимаете наши условия:\n',
                      style: TextStyle(color: Colors.black),
                    ),
                    TextSpan(
                      text: '\nПолитику использования данных\n',
                      style: TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          //Ссылка
                          launch('google.com');
                        },
                    ),
                    TextSpan(
                      text: '\nПолитику в отношении файлов cookie',
                      style: TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          launch('google.com');
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}