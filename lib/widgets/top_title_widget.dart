import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/screen_utils.dart';

class TopTitle extends StatefulWidget {
  final String title;

  const TopTitle({super.key, required this.title});

  @override
  State<TopTitle> createState() => _TopTitleState();
}

class _TopTitleState extends State<TopTitle> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = ScreenUtil.screenHeight(context);
    double screenWidth = ScreenUtil.screenWidth(context);
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.04, vertical: screenHeight * 0.04),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: LinearGradient(
                colors: [
                  Colors.grey.shade500,
                  Colors.white,
                ],
              ),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back,
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: screenWidth * 0.06),
              padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.02,
                horizontal: screenWidth * 0.05,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey.shade700,
                ),
                borderRadius: BorderRadius.circular(
                  15,
                ),
              ),
              child: Text(
                widget.title,
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: screenWidth * 0.07,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
