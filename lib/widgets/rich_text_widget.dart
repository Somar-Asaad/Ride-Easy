import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/screen_utils.dart';

class RichTextWidget extends StatelessWidget {
  final String firstWord;
  final String secondWord;

  const RichTextWidget(
      {super.key, required this.firstWord, required this.secondWord});

  @override
  Widget build(BuildContext context) {
    double screenHeight = ScreenUtil.screenHeight(context);
    double screenWidth = ScreenUtil.screenWidth(context);
    return Container(
      margin: EdgeInsets.fromLTRB(
        screenWidth * 0.025,
        screenHeight * 0.025,
        screenWidth * 0.025,
        screenHeight * 0.01,
      ),
      child: RichText(
        text: TextSpan(
          text: '$firstWord ',
          style: GoogleFonts.roboto(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: screenWidth * 0.06,
          ),
          children: [
            TextSpan(
              text: secondWord,
              style: GoogleFonts.roboto(
                color: Colors.black,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
