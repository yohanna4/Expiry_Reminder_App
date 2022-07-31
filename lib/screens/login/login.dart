// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:expiry_reminder/provider/constants.dart';
import 'package:expiry_reminder/screens/register/register.dart';
import 'package:expiry_reminder/widgets/customButton.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  String? _email;
  String? _password;
  bool obsecurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Login to your account",
                    style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                  )
                ],
              ),
              defaultPadding(
                Column(
                  children: <Widget>[
                    inputFields(),
                    SizedBox(
                      height: 10,
                    ),
                    Row(children: [
                      Spacer(),
                      GestureDetector(
                        // onTap: () => Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) =>
                        //             ForgotPasswordScreen())),
                        child: Text(
                          "Forgot Password",
                          style:
                              TextStyle(decoration: TextDecoration.underline),
                        ),
                      )
                    ]),
                  ],
                ),
              ),
              defaultPadding(
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: CustomButton(
                    onPressed: () async {
                      final isValidForm = _formKey.currentState!.validate();
                      if (isValidForm) {
                        // login();
                      }
                    },
                    height: 50,
                    inputText: "Login",
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Don't have an account?"),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterScreen()));
                      },
                      child: Text(
                        " Sign up",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      )),
                ],
              ),
            ],
          )),
    );
  }

  Widget inputFields() {
    return Form(
        key: _formKey,
        child: Column(children: [
          TextFormField(
            // focusNode: FocusScope.of(context).nextFocus(),
            // onFieldSubmitted: (_) =>
            //     nextFocusNode?.requestFocus(),
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: "example@email.com",
              labelText: "Email",
              border: OutlineInputBorder(),
            ),
            onChanged: (newValue) => _email = newValue,
            validator: (String? value) {
              final phoneNo = RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
              if (value!.isNotEmpty) {
                return "Please Enter A valid Email Address (example@email.com)";
              } else if (phoneNo.hasMatch(value) == false) {
                return "Please Enter An Email Address ";
              }
              return null;
            },
          ),
          SizedBox(
            height: 20,
          ),
          //password field
          TextFormField(
            obscureText: obsecurePassword,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    obsecurePassword = !obsecurePassword;
                  });
                },
                icon: Icon(obsecurePassword
                    ? Icons.visibility_off
                    : Icons.visibility), //
              ),
              labelText: "Password",
              border: OutlineInputBorder(),
            ),
            onChanged: (newValue) => _password = newValue,
            validator: (value) {
              if (value!.isEmpty) {
                return "Please Enter your password";
              } else if (value.length < 8) {
                return "Password is too short";
              } else {
                return null;
              }
            },
          ),
        ]));
  }

  Widget loginErrorDialog() {
    return AlertDialog(
      title: Text(
        "Incorrect Number or Password",
        style: TextStyle(fontSize: 16),
      ),
      actions: [
        MaterialButton(
          elevation: 0,
          // color: primaryColor,
          height: 40,
          minWidth: 90,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          onPressed: () {
            Navigator.of(this.context, rootNavigator: true).pop();
          },
          child: Text("ok"),
        ),
      ],
    );
  }
}
