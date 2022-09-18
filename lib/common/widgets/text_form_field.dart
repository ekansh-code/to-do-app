import 'package:flutter/material.dart';
import 'package:todo_app/resources/themes/text_theme.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key, required this.labelText, required this.textEditingController,this.isRequired=true});
  final TextEditingController textEditingController;
  final String labelText;
  final bool isRequired;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      validator: (value) {
        if ((value == null || value.isEmpty) && isRequired) {
          return 'Field cannot be empty';
        }
        return null;
      },
      cursorColor: Colors.teal,
      decoration: InputDecoration(
        label: Text(
          labelText,
          style: normalText1.copyWith(color: Colors.teal),
        ),
        hintText: 'Enter $labelText Here',
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.teal,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(
            color: Colors.teal,
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(
            color: Colors.teal,
          ),
        ),
      ),
    );
  }
}
