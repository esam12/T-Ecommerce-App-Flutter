import 'package:flutter/material.dart';

class TTextFormField extends StatelessWidget {
  const TTextFormField({
    super.key,
    required this.prefixIcon,
    required this.labelText,
    this.suffixIcon,
    this.obscureText,
    this.controller, this.validator, this.onPressedOnSuffixIcon,
  });
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final String labelText;
  final bool? obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function()? onPressedOnSuffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      expands: false,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
          prefixIcon: Icon(prefixIcon),
          suffixIcon: IconButton(onPressed: onPressedOnSuffixIcon, icon: Icon(suffixIcon),),
          labelText: labelText),
    );
  }
}
