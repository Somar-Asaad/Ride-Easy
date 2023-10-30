import 'package:flutter/material.dart';

class TextFieldWithTitle extends StatelessWidget {
  const TextFieldWithTitle({
    Key? key,
    required this.title,
    this.hintText,
    this.fontWeight,
    this.maxLines,
  }) : super(key: key);
  final String title;
  final String? hintText;
  final FontWeight? fontWeight;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.grey.shade500,
              fontSize: 16,
              fontWeight: fontWeight ?? FontWeight.normal,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            maxLines: maxLines,
            style: const TextStyle(
              color: Colors.black,
            ),
            decoration: InputDecoration(
              hintText: hintText ?? '',
              hintStyle: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 13,
              ),
              border: InputBorder.none,
              filled: true,
              fillColor: Colors.grey.shade300,
            ),
          ),
        ],
      ),
    );
  }
}
