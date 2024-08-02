import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RoundedInputField extends StatelessWidget {
  late IconData? prefixIcon;
  double prefixIconSize;
  Color? prefixIconColor;
  bool obscureText;
  String? placeholder;
  RoundedInputField({
    super.key,
    this.prefixIcon,
    this.obscureText = false,
    this.prefixIconSize = 24,
    this.prefixIconColor,
    this.placeholder = "",
  });
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      style: const TextStyle(color: Colors.grey),
      decoration: InputDecoration(
        fillColor: Colors.grey[100],
        prefixIcon: Icon(
          prefixIcon,
          color: prefixIconColor ?? Colors.grey,
          size: prefixIconSize,
        ),
        filled: true,
        hintText: placeholder,
        hintStyle: const TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
              10.0), // Adjust the radius for rounded corners
          borderSide: BorderSide(
            color: Colors.grey[300]!,
            width: 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.grey[300]!,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.grey[300]!,
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
