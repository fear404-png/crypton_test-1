import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyFormState();
}

class MyFormState extends State {
  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Color(0xFFE74249), Color(0xFFBB4E75)])),
        child: new Form(
            key: _formKey,
            child: new Column(
              children: <Widget>[
                new Text(
                  'Nickname',
                  style: TextStyle(fontSize: 20.0),
                ),
                new TextFormField(validator: (value) {
                  if (value!.isEmpty) return 'Nick name';

                  String p = "[a-zA-Z\_]";

                  RegExp regExp = new RegExp(p);

                  if (regExp.hasMatch(value)) return null;

                  return 'Только символы латинского алфавита или “_” (underscore)';
                }),
                new SizedBox(height: 20.0),
                new Text(
                  'Введите пароль',
                  style: TextStyle(fontSize: 20.0),
                ),
                new TextFormField(validator: (value) {
                  if (value!.isEmpty) return 'Пожалуйста введите свой пароль';

                  if ((value.length<3 || value.length>9)) return 'пароль должен содержать от 3 до 9 символов';
                }),
                new SizedBox(height: 20.0),
                new RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate())
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text('ты типа вошел//доделай лучше переход на страницу с новостями и неактивность кнопки'),
                        backgroundColor: Colors.green,
                      ));
                  },
                  child: Text('Sign in'),
                  color: Color(0x00),
                  textColor: Colors.white,
                )
              ],
            )));
  }
}

void main() => runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new Scaffold(
      appBar: new AppBar(
        backgroundColor: Color(0x00),
        title: new Text('Login'),
      ),
      body: new MyForm(),
    )));
