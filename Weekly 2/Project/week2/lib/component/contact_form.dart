import 'package:flutter/material.dart';
import '../style.dart';

class ContactForm extends StatelessWidget {
  TextEditingController? controller;
  int? lines;
  void Function(String)? onChanged;
  ContactForm(
      {super.key,
      required this.controller,
      required this.lines,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: TextFormField(
        maxLines: lines,
        controller: controller,
        onChanged: onChanged,
        cursorColor: primaryColor,
        decoration: InputDecoration(
          filled: true,
          fillColor: formColor,
          labelStyle: TextStyle(
            color: blackColor,
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: disableColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor),
          ),
        ),
        // decoration: InputDecoration(
        //   label: Text('${label}'),
        //   hintText: '${hint}',
        //   border: f),
        // fillColor: _primaryColor
      ),
    );
  }
}
