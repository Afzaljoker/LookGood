import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:look_good/constants.dart';

class  input_field extends StatelessWidget {
  final String hintText;
  final Function(String) onChanged;
  final bool isPasswordField;
  input_field({this.hintText, this.onChanged, this.isPasswordField});


  @override
  Widget build(BuildContext context) {
    bool _isPasswordField = isPasswordField ?? false;

    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 24.0,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: BorderRadius.circular(12.0)
      ),
      child: TextField(
        obscureText: _isPasswordField,
        onChanged:  onChanged,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText ?? 'Email',
          contentPadding: EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 20.0
          )

        ),
        style: Constant.regularText,
      ),
    );
  }
}
