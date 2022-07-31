import 'package:expiry_reminder/provider/constants.dart';
import 'package:expiry_reminder/screens/changePassword/change_password.dart';
import 'package:expiry_reminder/widgets/customButton.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 20,
          ),
        ),
        title: const Text(
          "Profile",
          // style: TextStyle(fontFamily: fontf),
        ),
        iconTheme: Theme.of(context).iconTheme,
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          titleText("PROFILE"),
          const SizedBox(height: 10),
          buildProfileDetail(),
          // const SizedBox(height: 10),
          titleText("TIMEZONE"),
          const SizedBox(height: 20),
          Center(
            child: CustomButton(
              width: MediaQuery.of(context).size.width - 42,
              inputText: "CHANGE PASSWORD",
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChangePasswordScreen()));
              },
              height: 45,
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: CustomButton(
              width: MediaQuery.of(context).size.width - 42,
              inputText: "LOGOUT",
              onPressed: () {},
              height: 45,
            ),
          ),
        ],
      )),
    );
  }

  Widget buildProfileDetail() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(25, 7, 25, 10),
        child: Column(
          children: [
            TextFormField(
              enabled: false,
              initialValue: "name",
              decoration: const InputDecoration(
                labelText: " Name",
                border: OutlineInputBorder(borderSide: BorderSide()),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            TextFormField(
              enabled: false,
              initialValue: "example@gmail.com",
              decoration: const InputDecoration(
                labelText: "Email Address",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ));
  }
}
