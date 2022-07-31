import 'package:expiry_reminder/provider/constants.dart';
import 'package:expiry_reminder/widgets/customButton.dart';
import 'package:flutter/material.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  String? _otp;
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
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    "Verification",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Verification code has been sent to ______",
                    style: TextStyle(
                        color: Color.fromARGB(255, 151, 151, 151),
                        fontSize: 15),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            defaultPadding(
              TextFormField(
                // focusNode: ,
                // onFieldSubmitted: (_) =>
                //     nextFocusNode?.requestFocus(),
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  hintText: "code",
                  border: OutlineInputBorder(),
                ),
                onChanged: (newValue) => _otp = newValue,
                // validator: (String? value) {
                //   if (value != null && value.length < 4) {
                //     return "Please Enter your name";
                //   } else {
                //     return null;
                //   }
                // },
              ),
            ),
            SizedBox(
              width: 15,
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 38),
              child: CustomButton(
                width: double.infinity,
                onPressed: () {},
                height: 45,
                inputText: "Verify",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ));
  }
}
