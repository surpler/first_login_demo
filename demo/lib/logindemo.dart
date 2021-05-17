import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'vClogindemo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = new GlobalKey<FormState>();

  String _userID;
  String _password;
  // bool _isChecked = true;
  // bool _isLoading;
  // IconData _checkIcon = Icons.check_box;

  // void _changeFormToLogin() {
  // _formKey.currentState.reset();
  // }

  void _onLogin() {
    final form = _formKey.currentState;
    form.save();

    if (_userID == '') {
      _showMessageDialog('账号不可为空');
      return;
    }
    if (_password == '') {
      _showMessageDialog('密码不可为空');
      return;
    }
  }

  void _showMessageDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text('提示'),
          content: new Text(message),
          actions: <Widget>[
            new FlatButton(
              child: new Text("ok"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _showEmailInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15.0, 10.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        style: TextStyle(fontSize: 15),
        decoration: new InputDecoration(
          border: InputBorder.none,
          hintText: '请输入帐号',
        ),
        onSaved: (value) => _userID = value.trim(),
      ),
    );
  }

  Widget _showPasswordInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15.0, 10.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        obscureText: true,
        autofocus: false,
        style: TextStyle(fontSize: 15),
        decoration: new InputDecoration(
            border: InputBorder.none,
            hintText: '请输入密码',
            suffix: Icon(Icons.remove_red_eye)),
        onSaved: (value) => _password = value.trim(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.fromLTRB(289, 13, 16, 13),
          child: FlatButton(
            color: Color(0x000000),
            child: Text(
              '验证码登录',
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => VClogindemo()));
            },
          ),
        ),
        Container(
          child: Text(
            '密码登录',
            style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
          ),
          padding: const EdgeInsets.fromLTRB(16, 20, 255, 16),
        ),
        Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
            child: Column(
              children: <Widget>[
                _showEmailInput(),
                Divider(
                  height: 0.5,
                  indent: 16.0,
                  color: Colors.grey[300],
                ),
                _showPasswordInput(),
                Divider(
                  height: 0.5,
                  indent: 16.0,
                  color: Colors.grey[300],
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Container(
          height: 60,
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: RaisedButton(
            child: Text(
              '登录',
              style: TextStyle(fontSize: 18.0),
            ),
            textColor: Colors.white,
            color: Colors.blue,
            onPressed: () {
              _onLogin();
            },
          ),
        ),
        Container(
            padding: const EdgeInsets.fromLTRB(0, 5, 16, 0),
            alignment: Alignment.centerRight,
            child: Text.rich(TextSpan(children: [
              TextSpan(
                text: "忘记密码",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12.0,
                ),
                // recognizer: _tapRecognizer
              ),
            ]))),
        Container(
            child: Container(
                alignment: Alignment.center,
                child: Text.rich(TextSpan(children: [
                  TextSpan(
                    text: "还没账号？快去注册",
                    style: TextStyle(color: Colors.blue),
                    // recognizer: _tapRecognizer
                  ),
                ])))),
      ],
    ));
  }
}
