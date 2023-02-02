import 'package:bla_bla/UI/auth/signup_screen.dart';
import 'package:bla_bla/widgets/loginRoundButton.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        decoration: const InputDecoration(
                            hintText: 'Email',
                            helperText: 'e.g john@gmail.com',
                            prefixIcon: Icon(Icons.email)),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Enter Email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        obscureText: true,
                        controller: passwordController,
                        decoration: const InputDecoration(
                            hintText: 'Password', prefixIcon: Icon(Icons.lock)),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Enter Password';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 50,
                      )
                    ],
                  )),
              LoginRoundButton('Login', () {
                if (_formKey.currentState.validate()) {}
              }),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account ?"),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpScreen()));
                      },
                      child: Text("Sign Up !"))
                ],
              )
            ]),
      ),
    );
  }
}
