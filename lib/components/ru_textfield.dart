import 'package:flutter/material.dart';

class RUTextfield extends StatelessWidget {
  final String hintText;
  final bool obscuredText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final AutovalidateMode autovalidateMode; // Add AutoValidateMode parameter
  final Color hintTextColor; // Add hintTextColor parameter

  const RUTextfield({
    super.key,
    required this.hintText,
    required this.obscuredText,
    required this.controller,
    this.validator,
    this.autovalidateMode = AutovalidateMode.disabled, 
    this.hintTextColor = Colors.grey, 
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder( 
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFad8de3)),
        ),
        hintText: hintText,
        hintStyle: TextStyle(color: hintTextColor), 
      ),
      obscureText: obscuredText,
      validator: validator,
      autovalidateMode: autovalidateMode, 
    );
  }
}
