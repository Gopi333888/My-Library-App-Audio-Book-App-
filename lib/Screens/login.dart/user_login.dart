import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mylibrary/Screens/AdminPages/datastoredpage.dart';
import 'package:mylibrary/Screens/NavigatorBar/navigator_bar.dart';
import 'package:mylibrary/Screens/helper/helper/sharepreference.dart';
import 'package:mylibrary/Screens/login.dart/signup_screen.dart';
import 'package:mylibrary/database/service/auth_service.dart';
import 'package:mylibrary/database/service/database_service.dart';
import 'package:mylibrary/database/service/hivedatabase.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({super.key});

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  final formkey = GlobalKey<FormState>();
  final dividers = const SizedBox(
    height: 20,
  );
  String password = "";
  String email = "";
  bool isPasswordVisible = false;
  AuthService authservice = AuthService();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 55, top: 60),
                  child: Image.asset(
                    "assets/images/My password-amico (1).png",
                    width: 290,
                    height: 290,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 40, top: 0),
                  child: Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 40, top: 15),
                  child: Text(
                    "Please Login To Continue",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey),
                  ),
                ),
                dividers,
                Padding(
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
                        email = value;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: radius15,
                              borderSide: const BorderSide(
                                color: Colors.grey,
                                width: 2,
                              )),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.white,
                            width: 2,
                          )),
                          labelText: "Email",
                          labelStyle: const TextStyle(color: Colors.white),
                          prefixIcon: const Icon(
                            Icons.mail,
                            color: Colors.white,
                          ) // Remove the default border
                          ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 20),
                  child: SizedBox(
                    width: 350,
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your password";
                        } else if (value.length < 6) {
                          return "Enter at least 6 characters";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        password = value;
                      },
                      obscureText: !isPasswordVisible,
                      style: const TextStyle(color: Colors.white), //
                      keyboardType: TextInputType
                          .text, // Us  style: TextStyle(color: Colors.white), /  style: TextStyle(color: Colors.white), /e TextInputType.text for passwords
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: radius15,
                            borderSide: const BorderSide(
                              color: Colors.grey,
                              width: 2,
                            )),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.grey,
                          width: 2,
                        )),
                        labelText: "Password",
                        labelStyle: const TextStyle(color: Colors.white),
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isPasswordVisible = !isPasswordVisible;
                            });
                          },
                          child: Icon(
                            isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 70, top: 35),
                  child: SizedBox(
                    height: 60,
                    width: 240,
                    child: ElevatedButton(
                      onPressed: () {
                        login();
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 97, 225, 101),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      child:
                          const Text("LOGIN", style: TextStyle(fontSize: 17)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 75, top: 20),
                  child: Row(
                    children: [
                      const Text(
                        "Don't have an Account ?",
                        style: TextStyle(fontSize: 17, color: Colors.grey),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => const SignupScreen(),
                              ),
                              (route) => false);
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 97, 225,
                                  101)), // Adjust the font size as needed
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void login() async {
    if (formkey.currentState!.validate()) {
      await authservice.loginUserAccount(email, password).then((value) async {
        if (value == UserCredentialConstant.user) {
          QuerySnapshot snapshot =
              await Databaseservice(uid: FirebaseAuth.instance.currentUser!.uid)
                  .gettingUserData(email);
          await SharedPreferenceClass.saveUserLoggedInStatus(true);
          await SharedPreferenceClass.saveusername(
              snapshot.docs[0]['fullName']);
          await SharedPreferenceClass.savepassword(password);
          await SharedPreferenceClass.savephonenumber(email);
          currentuser = FirebaseAuth.instance.currentUser!.uid;
          print('user id -- ${currentuser}');
          getFavorite();
          // ignore: use_build_context_synchronously
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const NavigatorScreen(),
              ),
              (route) => false);
        } else if (UserCredentialConstant.admin == value) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const DataStoredScreen(),
              ),
              (route) => false);
        } else {
          showSnackBar(
              context, Colors.red, "Username or Password is Incorrect");
        }
      });
    }
  }
}

void showSnakBar(context, color, message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    backgroundColor: color,
    duration: const Duration(seconds: 5),
  ));
}

BorderRadius radius15 = BorderRadius.circular(15);
