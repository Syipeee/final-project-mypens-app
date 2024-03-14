import 'package:flutter/material.dart';

class CustomForm extends StatefulWidget {
  final String hintText;
  final String helperText;
  final TextEditingController? controller;

  const CustomForm({
    Key? key,
    required this.hintText,
    required this.helperText,
    required this.controller,
  }) : super(key: key);

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: widget.controller,
          decoration: InputDecoration(
            hintText: widget.hintText,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 16.0,
            ),
            helperText: widget.helperText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Colors.grey,
                width: 2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
