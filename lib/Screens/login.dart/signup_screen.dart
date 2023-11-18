import 'package:flutter/material.dart';
import 'package:mylibrary/Screens/NavigatorBar/navigator_bar.dart';
import 'package:mylibrary/Screens/helper/helper/sharepreference.dart';
import 'package:mylibrary/Screens/login.dart/user_login.dart';
import 'package:mylibrary/Screens/service/auth_service.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final formKey = GlobalKey<FormState>();
  bool _isloading = false;
  String fullName = "";
  String email = "";
  String password = "";
  String cpassword = "";

  bool obscureText = true;
  AuthService authservice = AuthService();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phonenumberController = TextEditingController();

  @override
  void dispose() {
    // Dispose of the controllers to prevent memory leaks
    usernameController.dispose();
    passwordController.dispose();
    phonenumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusNode currentfocus = FocusScope.of(context);
        if (!currentfocus.hasPrimaryFocus) {
          currentfocus.unfocus();
        }
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: _isloading
              ? Center(
                  child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor),
                )
              : SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>  const UserLogin(),
                            ));
                          },
                          icon: const Icon(Icons.arrow_back_ios_new_sharp),
                          color: Colors.white,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 40, top: 40),
                          child: Text(
                            "Create Account",
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 43),
                          child: Text(
                            "Please fill the input below here .",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 30),
                          child: SizedBox(
                            width: 350,
                            child: TextFormField(
                              style: const TextStyle(color: Colors.white),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter your Name";
                                } else if (value.length < 3) {
                                  return "Enter atleast 3 character";
                                } else
                                  // ignore: curly_braces_in_flow_control_structures
                                  return null;
                              },
                              onChanged: (value) {
                                fullName = value;
                              },
                              keyboardType: TextInputType.name,
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
                                  labelText: "User Name",
                                  labelStyle:
                                      const TextStyle(color: Colors.white),
                                  prefixIcon: const Icon(
                                    Icons.person,
                                    color: Colors.white,
                                  ) // Remove the default border
                                  ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 30),
                          child: SizedBox(
                            width: 350,
                            child: TextFormField(
                              style: const TextStyle(color: Colors.white),
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
                                  labelStyle:
                                      const TextStyle(color: Colors.white),
                                  prefixIcon: const Icon(
                                    Icons.email,
                                    color: Colors.white,
                                  ) // Remove the default border
                                  ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 25),
                          child: SizedBox(
                            width: 350,
                            child: TextFormField(
                              style: const TextStyle(color: Colors.white),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter your Password";
                                } else if (value.length < 6) {
                                  return "Enter at least 6 characters";
                                }
                                return null;
                              },
                              onChanged: (value) {
                                password = value;
                              },
                              obscureText: obscureText,
                              keyboardType: TextInputType.number,
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
                                labelText: "Password",
                                labelStyle:
                                    const TextStyle(color: Colors.white),
                                prefixIcon: const Icon(
                                  Icons.lock,
                                  color: Colors.white,
                                ),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      obscureText = !obscureText;
                                    });
                                  },
                                  child: Icon(
                                    obscureText
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
                          padding: const EdgeInsets.only(left: 20, top: 25),
                          child: SizedBox(
                            width: 350,
                            child: TextFormField(
                              style: const TextStyle(color: Colors.white),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter your Password";
                                } else if (value.length < 6) {
                                  return "Enter at least 6 characters";
                                }
                                return null;
                              },
                              onChanged: (value) {
                                password = value;
                              },
                              obscureText: obscureText,
                              keyboardType: TextInputType.number,
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
                                labelText: "Confirm Password",
                                labelStyle:
                                    const TextStyle(color: Colors.white),
                                prefixIcon: const Icon(
                                  Icons.lock,
                                  color: Colors.white,
                                ),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      obscureText = !obscureText;
                                    });
                                  },
                                  child: Icon(
                                    obscureText
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
                          padding: const EdgeInsets.only(left: 80, top: 40),
                          child: SizedBox(
                              height: 60,
                              width: 240,
                              child: ElevatedButton(
                                onPressed: () async {
                                  signUp();
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      const MaterialStatePropertyAll(
                                    Color.fromARGB(255, 97, 225, 101),
                                  ),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          30), // Adjust the radius as needed
                                    ),
                                  ),
                                ),
                                child: const Text(
                                  "SIGN UP",
                                  style: TextStyle(fontSize: 17),
                                ),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 75, top: 40),
                          child: Row(
                            children: [
                              const Text(
                                "Dont have an Account ?",
                                style:
                                    TextStyle(fontSize: 17, color: Colors.grey),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const UserLogin()));
                                },
                                child: const Text(
                                  "Sign In",
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
      ),
    );
  }

  signUp() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        _isloading = true;
      });
      await authservice
          .registerUserWithEmailandPassword(fullName, email, password)
          .then((value) async {
        if (value == true) {
          await SharedPreferenceClass.saveUserLoggedInStatus(true);
          await SharedPreferenceClass.saveusername(fullName);
          await SharedPreferenceClass.savepassword(password);
          await SharedPreferenceClass.savephonenumber(email);
          // ignore: use_build_context_synchronously
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const NavigatorScreen(),
              ),
              (route) => false);
        } else {
          showSnackBar(context, Colors.red,
              const Text("Username or Password is Incorrect"));
        }
      });
    }
  }
}

void showSnackBar(context, color, message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    backgroundColor: color,
    duration: const Duration(seconds: 5),
  ));
}

BorderRadius radius15 = BorderRadius.circular(15);
