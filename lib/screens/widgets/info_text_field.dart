import 'package:addiction_app/utils/size_config.dart';
import 'package:flutter/material.dart';

class InfoTextField extends StatelessWidget {
  final String hint;
  final IconData prefixIcon;
  final TextEditingController controller;
  final bool obscureText;

  InfoTextField(
      {required this.hint,
      required this.prefixIcon,
      required this.controller,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenHeight(15),
        horizontal: getProportionateScreenHeight(18),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            isDense: true,
            hintText: hint,
            filled: true,
            fillColor: Colors.grey.withOpacity(0.4),
            prefixIcon: Icon(prefixIcon),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none,
            )),
      ),
    );
  }
}
