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

  void _auth() {
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
            children: <Widget>[
          TextField(
          decoration: InputDecoration(
              labelText: "NickName",
              labelStyle: TextStyle(fontSize: 12))),
              TextFormField(validator: (value) {
                
                if (value!.isEmpty) return 'Nick name';

                String p = "[a-zA-Z\_]";

                RegExp regExp = new RegExp(p);

                if (regExp.hasMatch(value)) return null;

                return 'Только символы латинского алфавита или “_” (underscore)';
              }),


              new TextFormField(validator: (value) {
                if (value!.isEmpty) return 'Пожалуйста введите свой пароль';

                if ((value.length<3 || value.length>9)) return 'пароль должен содержать от 3 до 9 символов';
              }),
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
