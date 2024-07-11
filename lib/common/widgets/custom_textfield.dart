import 'package:flutter/material.dart';
class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key,required this.controller, required this.hintText, this.maxLines = 1}) : super(key: key);
  final TextEditingController controller;
  final String hintText;
  final int maxLines;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      validator: (val){
        if(val == null || val.isEmpty){
          return 'Enter your $hintText';
        }
        return null;
      },
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black38,
          )
        ),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black38,
            ),
        ),
      ),
    );
  }
}
