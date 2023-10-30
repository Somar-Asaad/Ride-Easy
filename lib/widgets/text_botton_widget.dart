import 'package:flutter/material.dart';

class TextButtonWidget extends StatefulWidget {
  const TextButtonWidget({
    Key? key,
    required this.title,
    required this.textColor,
    required this.backgroundColor,
    this.onTap,
  }) : super(key: key);
  final String title;
  final Color textColor;
  final Color backgroundColor;
  final Function()? onTap;

  @override
  State<TextButtonWidget> createState() => _TextButtonWidgetState();
}

class _TextButtonWidgetState extends State<TextButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: widget.backgroundColor,
      ),
      onPressed: widget.onTap,
      child: Text(
        widget.title,
        style: TextStyle(
          color: widget.textColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}