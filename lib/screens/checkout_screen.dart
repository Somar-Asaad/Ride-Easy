import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../utils/screen_utils.dart';
import '../widgets/top_title_widget.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({super.key});

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  DateTime _selectedStartDate = DateTime.now();
  DateTime _selectedEndDate = DateTime.now();
  DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context, String title) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        title == 'Start Date'
            ? _selectedStartDate = picked
            : _selectedEndDate = picked;
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = ScreenUtil.screenHeight(context);
    double screenWidth = ScreenUtil.screenWidth(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //app bar
              const TopTitle(
                title: 'Check Out',
              ),

              //dates container
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.025,
                  horizontal: screenWidth * 0.035,
                ),
                margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.035),
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                ),
                child: Column(
                  children: [
                    buildContainerForStartAndEndDate(
                        screenHeight, screenWidth, context, 'Start Date'),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    buildContainerForStartAndEndDate(
                        screenHeight, screenWidth, context, 'End Date'),
                  ],
                ),
              ),

              //coupon container
              buildTextFieldForApplyCoupon(screenWidth, screenHeight),

              //details Container
              buildDetailsContainer(screenHeight, screenWidth),
              //Pay Container
              buildPayContainer(screenHeight, screenWidth),
            ],
          ),
        ),
      ),
    );
  }

  Container buildDetailsContainer(double screenHeight, double screenWidth) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: screenHeight * 0.025, horizontal: screenWidth * 0.035),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Details',
            style: GoogleFonts.roboto(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: screenWidth * 0.045,
            ),
          ),
          const Divider(
            color: Colors.black,
            thickness: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DefaultTextStyle(
                style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                  fontSize: screenWidth * 0.038,
                  height: screenHeight * 0.0018,
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Days',
                    ),
                    Text(
                      'Rent',
                    ),
                    Text(
                      'Additional items',
                    ),
                    Text(
                      'Coupon Discount',
                    ),
                  ],
                ),
              ),
              DefaultTextStyle(
                style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                  fontSize: screenWidth * 0.038,
                  height: screenHeight * 0.0018,
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '4',
                    ),
                    Text(
                      '₹ 5996',
                    ),
                    Text(
                      '₹ 6400',
                    ),
                    Text(
                      '₹ 396',
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(
            color: Colors.black,
            thickness: 1,
          ),
          DefaultTextStyle(
            style: GoogleFonts.roboto(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: screenWidth * 0.05,
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Amount',
                ),
                Text(
                  '₹ 12000',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container buildPayContainer(double screenHeight, double screenWidth) {
    return Container(
      margin: EdgeInsets.only(
        top: screenHeight * 0.035,
        right: screenWidth * 0.04,
        left: screenWidth * 0.04,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 15),
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: () {},
        child: Text(
          'PAY',
          style: GoogleFonts.roboto(
            color: Colors.white,
            fontSize: screenWidth * 0.07,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Container buildTextFieldForApplyCoupon(
      double screenWidth, double screenHeight) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.03,
        vertical: screenHeight * 0.01,
      ),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.03,
            vertical: screenHeight * 0.01,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade500),
          ),
          filled: true,
          fillColor: Colors.white,
          hintText: 'Apply coupon',
          hintStyle: GoogleFonts.roboto(
            color: const Color.fromRGBO(140, 126, 126, 1),
            fontSize: screenWidth * 0.05,
          ),
        ),
      ),
    );
  }

  Container buildContainerForStartAndEndDate(
    double screenHeight,
    double screenWidth,
    BuildContext context,
    String title,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.01, horizontal: screenWidth * 0.035),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: GoogleFonts.roboto(
                  color: const Color.fromRGBO(140, 126, 126, 1),
                  fontWeight: FontWeight.w400,
                  fontSize: screenWidth * 0.05,
                ),
              ),
              title == 'Start Date'
                  ? Text(
                      DateFormat('dd-MM-yyyy')
                          .format(_selectedStartDate)
                          .toString(),
                      style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: screenWidth * 0.05,
                      ),
                    )
                  : Text(
                      DateFormat('dd-MMf-yyyy')
                          .format(_selectedEndDate)
                          .toString(),
                      style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: screenWidth * 0.05,
                      ),
                    )
            ],
          ),
          GestureDetector(
            onTap: () {
              _selectDate(context, title);
            },
            child: Image.asset(
              'assets/images/2012.png',
              scale: 4,
            ),
          ),
        ],
      ),
    );
  }
}
