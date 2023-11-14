import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget(
      {super.key,
      required this.controller,
      this.labeltext,
      required this.errorText,
      required this.keyboardType,
      this.optionalerror,
      this.counterText,
      this.hintText,
      this.suffixText,
      this.prefixText});

  final TextEditingController controller;
  final String? labeltext;
  final String errorText;
  final TextInputType keyboardType;
  final String? optionalerror;
  final String? counterText;
  final String? hintText;
  final String? suffixText;
  final String? prefixText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 0),
      child: SizedBox(
        width: 350,
        child: TextFormField(
          maxLines: null,
          controller: controller,
          decoration: InputDecoration(
              prefixText: prefixText,
              suffixText: suffixText,
              suffixStyle: GoogleFonts.poppins(
                  fontSize: 11, fontWeight: FontWeight.w500),
              hintText: hintText,
              counterText: counterText,
              labelText: labeltext,
              labelStyle: GoogleFonts.poppins(
                  fontSize: 11, fontWeight: FontWeight.w500),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide:
                    const BorderSide(width: 1, color: Color(0xFFDFDDDD)),
              ),
              contentPadding: const EdgeInsets.all(10)),
          keyboardType: keyboardType,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return errorText;
            }
            return null;
          },
        ),
      ),
    );
  }
}
