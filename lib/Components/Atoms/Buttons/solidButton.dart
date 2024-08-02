import 'package:flutter/material.dart';

class SolidButton extends StatelessWidget {
  final String? label;
  final Function? onPressed;
  const SolidButton({super.key, this.label, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed!();
      },
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
          Colors.orange[500],
        ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
      child: Text(
        label ?? "",
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
