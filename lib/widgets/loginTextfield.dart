import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoginTextfeild extends StatelessWidget {
  LoginTextfeild(
      {super.key,
      required this.controller,
      required this.keyboardType,
      required this.loginValues});

  final TextEditingController controller;
  final TextInputType keyboardType;
  late String loginValues;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 25,
      ),
      child: SizedBox(
        width: 350,
        child: TextFormField(
          style: const TextStyle(color: Colors.white), //
          validator: (val) {
            return RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(val!)
                ? null
                : "Please enter a valid email";
          },
          onChanged: (value) {
            loginValues = value;
          },
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.white,
                width: 2,
              )),
              labelText: "Email",
              labelStyle: TextStyle(color: Colors.white),
              prefixIcon: Icon(
                Icons.mail,
                color: Colors.white,
              ) // Remove the default border
              ),
        ),
      ),
    );
  }
}
