import 'package:flutter/material.dart';

class TTextFormField extends StatelessWidget {
  const TTextFormField(
      {super.key,
      required this.prefixIcon,
      required this.labelText,
      this.suffixIcon,
      this.obscureText});
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final String labelText;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      expands: false,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
          prefixIcon: Icon(prefixIcon),
          suffixIcon: Icon(suffixIcon),
          labelText: labelText),
    );
  }
}
