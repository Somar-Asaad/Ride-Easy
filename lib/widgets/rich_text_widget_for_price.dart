import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/screen_utils.dart';

class PricePerDayRichTextWidget extends StatelessWidget {
  final String price;
  final String theme;

  const PricePerDayRichTextWidget({
    super.key,
    required this.price,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = ScreenUtil.screenHeight(context);
    double screenWidth = ScreenUtil.screenWidth(context);
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: screenHeight * 0.005,
        horizontal: screenWidth * 0.025,
      ),
      child: RichText(
        text: TextSpan(
          text: '$price ',
          style: GoogleFonts.risque(
            color: theme == 'Dark' ? Colors.white : Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: screenWidth * 0.04,
          ),
          children: [
            TextSpan(
              text: ' per day',
              style: GoogleFonts.roboto(
                color: theme == 'Dark' ? Colors.white : Colors.black,
                fontSize: screenWidth * 0.04,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
