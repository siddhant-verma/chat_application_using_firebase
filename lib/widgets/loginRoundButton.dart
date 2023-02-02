import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class LoginRoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const LoginRoundButton(this.title, this.onTap);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: Colors.deepPurple, borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Text(
          title,
          style: TextStyle(color: Colors.white),
        )),
      ),
    );
  }
}
