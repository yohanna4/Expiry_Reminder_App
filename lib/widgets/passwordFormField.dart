// r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
import 'package:flutter/material.dart';

class PasswordFormField extends StatefulWidget {
  final ValueChanged<String> onchanged;
  final FormFieldValidator<String> validator;
  final String labelText;
  final String currentValue;
  final FocusNode? nextFocusNode;
  final FocusNode? focusNode;
  // bool isLoading = false;
  const PasswordFormField(
      {Key? key,
      required this.labelText,
      required this.onchanged,
      required this.validator,
      required this.currentValue,
      this.focusNode,
      this.nextFocusNode})
      : super(key: key);

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool _obsecurePassword = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: widget.focusNode,
      onFieldSubmitted: (_) => widget.nextFocusNode?.requestFocus(),
      initialValue: widget.currentValue,
      keyboardType: TextInputType.visiblePassword,
      obscureText: _obsecurePassword,
      decoration: InputDecoration(
          hintText: " ",
          icon: Icon(Icons.assignment_turned_in_rounded),
          labelText: "Password",
          border: OutlineInputBorder(),
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _obsecurePassword = !_obsecurePassword;
                });
              },
              icon: Icon(
                _obsecurePassword ? Icons.visibility : Icons.visibility_off,
                color: Colors.blue,
              ))),
      onChanged: widget.onchanged,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please Enter your password";
        } else if (value.length < 8) {
          return "Password is too short";
        } else
          return null;
      },
      // return null;
    );
  }
}
