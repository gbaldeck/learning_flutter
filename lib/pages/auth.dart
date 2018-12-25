import 'package:flutter/material.dart';
import '../null_types.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  final MutableNonNull<String> _email = mutableNonNullOf(it: "test");
  final MutableNonNull<String> _password = mutableNonNullOf(it: "test");
  final MutableNonNull<bool> _acceptTerms = mutableNonNullOf(it: false);
  final _formKey = GlobalKey<FormState>();

  double get targetWidth {
    final deviceWidth = MediaQuery.of(context).size.width;
    return deviceWidth > 550.0 ? 500.0 : deviceWidth * .95;
  }

  final String emailRegex =
      r"""(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])""";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.4),
              BlendMode.dstATop,
            ),
            image: AssetImage('assets/background.jpg'),
          ),
        ),
        child: Form(
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Container(
                width: targetWidth,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (email) {
                        if (email.isEmpty ||
                            !RegExp(emailRegex).hasMatch(email))
                          return "Email is required and must be valid!";
                        return null;
                      },
                      onSaved: (email) => _email.setIt(email),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        validator: (value) {
                          if (value.isEmpty || value.length < 5)
                            return "Password is required and must be 5+ characters!";
                          return null;
                        },
                        onSaved: (password) => _password.setIt(password)),
                    SizedBox(
                      height: 20.0,
                    ),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SwitchListTile(
                        title: Text('Accept Terms'),
                        value: _acceptTerms.getIt(),
                        onChanged: (value) {
                          setState(() {
                            _acceptTerms.setIt(value);
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    RaisedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          Navigator.pushReplacementNamed(context, '/products');
                          print('Email: ${_email.getIt()}');
                          print('Password: ${_password.getIt()}');
                        }
                      },
                      child: Text('LOGIN'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
