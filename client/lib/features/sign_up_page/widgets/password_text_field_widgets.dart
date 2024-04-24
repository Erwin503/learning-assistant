import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  final String label;

  PasswordTextField({required this.label});

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: TextField(
        obscureText: _obscureText,
        decoration: InputDecoration(
          hintText: widget.label,
          hintStyle: TextStyle(color: Color.fromARGB(255, 75, 91, 99)),
          border: InputBorder.none,
          suffixIcon: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: _togglePasswordVisibility,
          ),
        ),
      ),
    );
  }
}
