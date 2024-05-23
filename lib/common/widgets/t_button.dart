import 'package:flutter/material.dart';

class TElevatedButton extends StatelessWidget {
  const TElevatedButton({super.key, required this.text, this.onPressed});
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
