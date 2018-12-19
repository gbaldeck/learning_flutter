import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  String _email = "test";
  String _password = "test";
  bool _acceptTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                onChanged: (emailOrNull) => setState(
                      () => _email = emailOrNull ?? "test",
                    ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(labelText: 'Password'),
                onChanged: (passwordOrNull) => setState(
                      () => _password = passwordOrNull ?? "test",
                    ),
              ),
              SizedBox(
                height: 20.0,
              ),
              SwitchListTile(
                title: Text('Accept Terms'),
                value: _acceptTerms,
                onChanged: (value) {
                  setState(() {
                    _acceptTerms = value;
                  });
                },
              ),
              SizedBox(
                height: 20.0,
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
      ),
    );
  }
}
