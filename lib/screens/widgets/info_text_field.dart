import 'package:addiction_app/utils/size_config.dart';
import 'package:flutter/material.dart';

class InfoTextField extends StatefulWidget {
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
  State<InfoTextField> createState() => _InfoTextFieldState();
}

class _InfoTextFieldState extends State<InfoTextField>
    with WidgetsBindingObserver {
  // handles mobile web unfocus textfield
  final FocusNode inputFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // handles mobile web unfocus textfield
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    final value = WidgetsBinding.instance!.window.viewInsets.bottom;
    if (value == 0) {
      inputFocusNode.unfocus();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    inputFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenHeight(15),
        horizontal: getProportionateScreenHeight(18),
      ),
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.obscureText,
        keyboardType: TextInputType.number,
        focusNode: inputFocusNode,
        decoration: InputDecoration(
            isDense: true,
            hintText: widget.hint,
            filled: true,
            fillColor: Colors.grey.withOpacity(0.4),
            prefixIcon: Icon(widget.prefixIcon),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none,
            )),
      ),
    );
  }
}
