import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  final String? labelText;
  final String hintText;
  final IconData? prefixIcon, suffixIcon;
  final TextEditingController? controller;
  final bool haveLabel, readOnly;
  final FocusNode? focusNode; // Add FocusNode

  const CommonTextField({
    super.key,
    this.labelText,
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.haveLabel = true,
    this.readOnly = false,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controller,
        readOnly: readOnly,
        focusNode: focusNode,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
        ),
      ),
    );
  }
}
