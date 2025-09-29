import 'package:flutter/material.dart';

class PhoneInputField extends StatelessWidget {
  final TextEditingController controller;

  const PhoneInputField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: const InputDecoration(
        labelText: "Enter Phone Number (with country code)",
        hintText: "e.g. 919876543210",
      ),
      keyboardType: TextInputType.phone,
    );
  }
}
