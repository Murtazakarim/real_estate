
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Saint Petersburg',
        hintStyle: GoogleFonts.inter(
          fontSize: 15.0,
          color: const Color(0xFF7C7C7C),
          fontWeight: FontWeight.w400,
        ),
        prefixIcon: const Icon(Icons.search, color: Colors.black),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),

        fillColor: Colors.white,
        filled: true,
        contentPadding: const EdgeInsets.all(10.0),

      ),

      onSaved: (value) {
        // Implement search functionality here
      },
    );
  }
}
