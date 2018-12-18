import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
              onChanged: (email) => setState(
                    () => _email = email,
                  ),
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
              onChanged: (password) => setState(
                    () => _password = password,
                  ),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/products');
                print('Email: $_email');
                print('Password: $_password');
              },
              child: Text('LOGIN'),
            ),
          ],
        ),
      ),
    );
  }
}
