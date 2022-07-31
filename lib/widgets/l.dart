// import 'package:flutter/material.dart';

// class CustomButton extends StatelessWidget {
//   String email;
//   String password;
//   bool remember = false;
//   bool _passwordVisible = false;
//   bool isLoading = false;
//   const CustomButton({required this.email, required this.password});

//   @override
//   Widget build(BuildContext context) {
    // return TextFormField(
    //   keyboardType: TextInputType.phone,
    //   decoration: const InputDecoration(
    //     // icon: Icon(Icons.phone_android),
    //     labelText: "Phone Number",
    //     border: OutlineInputBorder(),
    //   ),
    //   onChanged: (newValue) => phoneNumber = newValue,
    //   validator: (String? value) {
    //     final phoneNo = RegExp(r'^0(9)\d{8}$');
    //     if (value!.isEmpty) {
    //       return "Please Enter a valid number (ex. 0920 10 10 10)";
    //     } else if (phoneNo.hasMatch(value) == false) {
    //       return "";
    //     }
    //     return null;
    //   },
    // );
//   }
// }

// Widget inputFields() {
//   return Form(
//       // key: _formKey,
//       // autovalidateMode: AutovalidateMode.always,
//       child: Column(children: [
//     //phone field
//     TextFormField(
//       keyboardType: TextInputType.phone,
//       decoration: const InputDecoration(
//         // icon: Icon(Icons.phone_android),
//         labelText: "Phone Number",
//         border: OutlineInputBorder(),
//       ),
//       onChanged: (newValue) => phoneNumber = newValue,
//       validator: (String? value) {
//         final phoneNo = RegExp(r'^0(9)\d{8}$');
//         if (value!.isEmpty) {
//           return "Please Enter a valid number (ex. 0920 10 10 10)";
//         } else if (phoneNo.hasMatch(value) == false) {
//           return "";
//         }
//         return null;
//       },
//     ),
//     SizedBox(
//       height: 20,
//     ),
//     //password field
//     TextFormField(
//       obscureText: !_passwordVisible,
//       decoration: InputDecoration(
//         suffixIcon: IconButton(
//           onPressed: () {
//             setState(() {
//               _passwordVisible = !_passwordVisible;
//             });
//           },
//           icon: Icon(
//               _passwordVisible ? Icons.visibility : Icons.visibility_off), //
//         ),
//         // icon: Icon(Icons.lock),
//         labelText: "Password",
//         border: OutlineInputBorder(),
//       ),
//       onChanged: (newValue) => password = newValue,
//       validator: (value) {
//         if (value!.isEmpty) {
//           return "Please Enter your password";
//         } else if (value.length < 8) {
//           return "Password is too short";
//         } else
//           return null;
//       },
//       // return null;
//     ),
//   ]));
// }
