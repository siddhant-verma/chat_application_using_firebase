import 'package:bla_bla/UI/auth/login_screen.dart';
import 'package:bla_bla/widgets/loginRoundButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text('SignUp'),
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
                              hintText: 'Password',
                              prefixIcon: Icon(Icons.lock)),
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
                LoginRoundButton('Sign up', () {
                  if (_formKey.currentState.validate()) {
                    _auth.createUserWithEmailAndPassword(
                        email: emailController.text.toString(),
                        password: passwordController.text.toString());
                  }
                }),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account ?"),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                        child: Text("Login !"))
                  ],
                )
              ]),
        ),
      ),
    );
  }
}
