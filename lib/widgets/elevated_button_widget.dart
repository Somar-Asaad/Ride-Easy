import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ElevatedButtonWidget extends StatefulWidget {
  const ElevatedButtonWidget({
    Key? key,
    required this.title,
    required this.color,
    required this.titleColor,
    required this.onTap,
  }) : super(key: key);
  final String title;
  final Color titleColor;
  final Color color;
  final Function()? onTap;

  @override
  State<ElevatedButtonWidget> createState() => _ElevatedButtonWidgetState();
}

class _ElevatedButtonWidgetState extends State<ElevatedButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onTap,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 15),
        backgroundColor: widget.color,
        shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        widget.title,
        style: GoogleFonts.roboto(
          color: widget.titleColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}