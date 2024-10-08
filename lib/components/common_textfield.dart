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
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: TextField(
        controller: controller,
        readOnly: readOnly,
        focusNode: FocusNode(canRequestFocus: readOnly),
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          labelStyle: const TextStyle(color: Colors.black, fontSize: 18),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          prefixIcon: Icon(prefixIcon),
          suffixIcon: Icon(suffixIcon),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
        ),
      ),
    );
  }
}
