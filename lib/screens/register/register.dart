import 'package:expiry_reminder/screens/login/login.dart';
import 'package:flutter/material.dart';
import 'package:expiry_reminder/provider/constants.dart';
import 'package:expiry_reminder/widgets/customButton.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  String? _email;
  String? _password;
  String? _confrimPassword;
  bool obsecurePassword = true;
  bool obsecurePasswordConfrim = true;
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
              size: 25,
              color: Colors.black,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Create an account, it's free!",
                        style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  defaultPadding(
                    inputFields(),
                  ),
                  SizedBox(
                    height: 30,
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
                        inputText: "Sign Up",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Already have an account?"),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          },
                          child: Text(
                            " Sign in",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          )),
                    ],
                  ),
                ],
              )),
        ));
  }

  Widget inputFields() {
    return Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: _formKey,
        child: Column(children: [
          TextFormField(
            // focusNode: ,
            // onFieldSubmitted: (_) =>
            //     nextFocusNode?.requestFocus(),
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(
              hintText: "John",
              labelText: "Name",
              border: OutlineInputBorder(),
            ),
            onChanged: (newValue) => _email = newValue,
            validator: (String? value) {
              if (value != null && value.length < 4) {
                return "Please Enter your name";
              } else {
                return null;
              }
            },
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            // focusNode: ,
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
          SizedBox(
            height: 20,
          ),
          TextFormField(
            obscureText: obsecurePasswordConfrim,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    obsecurePasswordConfrim = !obsecurePasswordConfrim;
                  });
                },
                icon: Icon(obsecurePasswordConfrim
                    ? Icons.visibility_off
                    : Icons.visibility), //
              ),
              // icon: Icon(Icons.lock),
              labelText: "Confirm Password",
              border: OutlineInputBorder(),
            ),
            onChanged: (newValue) => _confrimPassword = newValue,
            validator: (value) {
              if (value!.isEmpty) {
                return "Please Enter your password";
              } else if (_password != value) {
                return "Passwords don't match";
              }
              return null;
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
