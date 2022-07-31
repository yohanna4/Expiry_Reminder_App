// r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
import 'package:flutter/material.dart';

class EmailFormField extends StatelessWidget {
  // final TextEditingController controller;
  final ValueChanged<String>? onchanged;
  final FormFieldValidator<String> validator;
  // final String currentValue;
  final FocusNode? nextFocusNode;
  final FocusNode? focusNode;
  const EmailFormField({
    Key? key,
    // required this.controller,
    required this.validator,
    // required this.currentValue,
    this.focusNode,
    this.onchanged,
    this.nextFocusNode,
    onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // controller: controller,
      focusNode: focusNode,
      onFieldSubmitted: (_) => nextFocusNode?.requestFocus(),
      // initialValue: "",
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        hintText: "example@email.com",
        labelText: "Email",
        border: OutlineInputBorder(),
      ),
    );
  }
}
