import 'package:expiry_reminder/provider/constants.dart';
import 'package:expiry_reminder/screens/changePassword/password_changed.dart';
import 'package:expiry_reminder/widgets/customButton.dart';
import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  String? phoneNumber;
  bool fromSignup = false;
  String? _currentPassword;
  String? _newPassword;
  String? _confrimNewPassword;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 25,
          ),
        ),
        iconTheme: Theme.of(context).iconTheme,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Change Password",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            buildInputFields(),
            const SizedBox(
              height: 30,
            ),
            CustomButton(
              width: double.infinity,
              onPressed: () async {
                final isValidForm = _formKey.currentState!.validate();
                if (isValidForm) {
                  // login();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PasswordChangedScreen()));
                }
              },
              height: 55,
              inputText: "CHANGE PASSWORD",
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInputFields() {
    return Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: _formKey,
        child: Column(children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: "Current Password",
              border: OutlineInputBorder(),
            ),
            onChanged: (newValue) => _currentPassword = newValue,
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
          const SizedBox(
            height: 22,
          ),
          //password field
          TextFormField(
            decoration: InputDecoration(
              labelText: "New Password",
              border: OutlineInputBorder(),
            ),
            onChanged: (newValue) => _newPassword = newValue,
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
          const SizedBox(
            height: 22,
          ),
          TextFormField(
            decoration: InputDecoration(
              // icon: Icon(Icons.lock),
              labelText: "Confirm New Password",
              border: OutlineInputBorder(),
            ),
            onChanged: (newValue) => _confrimNewPassword = newValue,
            validator: (value) {
              if (value!.isEmpty) {
                return "Please Enter your password";
              } else if (_newPassword != value) {
                return "Passwords don't match";
              }
              return null;
            },
          ),
        ]));
  }
}
