import 'package:flutter/material.dart';
import 'package:addiction_app/utils/size_config.dart';

class RoundedButton extends StatelessWidget {
  final String title;
  final Color bgColor;
  final VoidCallback onPressed;

  RoundedButton(
      {required this.title, required this.bgColor, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: getProportionateScreenHeight(5),
          horizontal: getProportionateScreenWidth(5)),
      child: MaterialButton(
        textColor: Colors.white,
        color: bgColor,
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: getProportionateScreenHeight(20),
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
