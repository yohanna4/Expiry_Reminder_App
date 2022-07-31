import 'package:flutter/material.dart';
import 'package:expiry_reminder/widgets/customButton.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  String? phoneNumber;
  bool fromSignup = false;
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Reset Password",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Enter the email address to associated with your account to reset your password",
                    // textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromARGB(255, 151, 151, 151),
                        fontSize: 15),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Container(
                alignment: Alignment.topLeft,
                child: const Text(
                  "Email",
                  style: TextStyle(
                      color: Color.fromARGB(255, 65, 64, 64), fontSize: 15),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(23, 5, 23, 0),
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    // labelText: "Phone Number",
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (newValue) => phoneNumber = newValue,
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
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23),
              child: CustomButton(
                width: double.infinity,
                onPressed: () async {
                  final isValidForm = _formKey.currentState!.validate();
                  if (isValidForm) {
                    // login();
                  }
                },
                height: 55,
                inputText: "Continue",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ));
  }
}
