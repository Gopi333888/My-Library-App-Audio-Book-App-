import 'package:flutter/material.dart';

class BooksTextfield extends StatelessWidget {
  const BooksTextfield({
    super.key,
    required this.controller,
    this.labeltext,
  });
  final TextEditingController controller;
  final String? labeltext;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: SizedBox(
        width: 350,
        child: TextFormField(
          controller: controller,
          maxLines: null,
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              labelText: labeltext),
        ),
      ),
    );
  }
}
