import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nothing/screens/checkout_screen.dart';

import '../utils/screen_utils.dart';
import '../widgets/rich_text_widget.dart';
import '../widgets/rich_text_widget_for_price.dart';
import '../widgets/top_title_widget.dart';

class BikeDetailsScreen extends StatefulWidget {
  const BikeDetailsScreen({super.key});

  @override
  State<BikeDetailsScreen> createState() => _BikeDetailsScreenState();
}

class _BikeDetailsScreenState extends State<BikeDetailsScreen> {
  Map itemsToBeAdded = {
    'names': [
      'Riding Jacket',
      'Riding Gloves',
      'Helmet',
    ],
    'prices': [
      '800/',
      '800/',
      '800/',
    ],
    'images': [
      'assets/images/jacket.png',
      'assets/images/cloves.png',
      'assets/images/helmet.png'
    ],
  };

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Top section
              const TopTitle(
                title: 'Bike Details',
              ),

              //details with photo
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.04,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: screenHeight * 0.09,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Indian',
                            style: GoogleFonts.robotoSlab(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: screenWidth * 0.05,
                            ),
                            children: [
                              TextSpan(
                                text: '\nScout Bobber',
                                style: GoogleFonts.roboto(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: screenWidth * 0.055,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.03,
                        ),
                        buildContainerForDetails(
                            'Category', 'Cruiser', screenWidth, screenHeight),
                        buildContainerForDetails('Displacement', '1133 cc',
                            screenWidth, screenHeight),
                      ],
                    ),
                  ),

                  //bike image
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      height: screenHeight * 0.35,
                      child: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          Colors.grey.shade300,
                          BlendMode.overlay,
                        ), // This
                        child: Image.asset(
                          'assets/images/big_motor.png',
                        ), // Your image with a white background
                      ),
                    ),
                  ),
                ],
              ),

              //max speed and rent button
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.04,
                    ),
                    child: buildContainerForDetails(
                        'Max. Speed', '124 km/h', screenWidth, screenHeight),
                  ),
                  buildRentContainer(screenWidth, screenHeight),
                ],
              ),

              //Add items text
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.02,
                ),
                child: const RichTextWidget(
                  firstWord: 'Add',
                  secondWord: 'items',
                ),
              ),

              //Add items section
              ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    child: buildContainerForItemsToBeAdded(
                      screenWidth,
                      screenHeight,
                      index,
                    ),
                  );
                },
                itemCount: itemsToBeAdded['names'].length,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded buildRentContainer(double screenWidth, double screenHeight) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          debugPrint('1');
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => const CheckOutPage(),
            ),
          );
        },
        child: Container(
          margin: EdgeInsets.only(
            right: screenWidth * 0.04,
            bottom: screenHeight * 0.03,
          ),
          padding: EdgeInsets.only(
            left: screenWidth * 0.03,
            bottom: screenHeight * 0.004,
            top: screenHeight * 0.004,
          ),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Rent',
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontSize: screenWidth * 0.065,
                ),
              ),
              const PricePerDayRichTextWidget(
                price: '1499/',
                theme: 'Dark',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildContainerForDetails(
      title, detail, double screenWidth, double screenHeight) {
    return Container(
      width: screenWidth * 0.35,
      margin: EdgeInsets.only(
        right: screenWidth * 0.0001,
        bottom: screenHeight * 0.03,
      ),
      padding: EdgeInsets.only(
        left: screenWidth * 0.03,
        bottom: screenHeight * 0.01,
        top: screenHeight * 0.01,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color.fromRGBO(186, 186, 186, 1),
        ),
      ),
      child: RichText(
        text: TextSpan(
          text: title,
          style: GoogleFonts.roboto(
            color: const Color.fromRGBO(140, 126, 126, 1),
            fontWeight: FontWeight.w400,
            fontSize: screenWidth * 0.045,
          ),
          children: [
            TextSpan(
              text: '\n$detail',
              style: GoogleFonts.roboto(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: screenWidth * 0.045,
              ),
            )
          ],
        ),
      ),
    );
  }

  Container buildContainerForItemsToBeAdded(
      double screenWidth, double screenHeight, int index) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.026,
        vertical: screenHeight * 0.01,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.04,
        vertical: screenHeight * 0.006,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.black,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              //image
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.01,
                  vertical: screenHeight * 0.006,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Image.asset(
                  itemsToBeAdded['images'][index],
                  scale: 4,
                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.025,
                    ),
                    child: Text(
                      itemsToBeAdded['names'][index],
                      style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: screenWidth * 0.04,
                      ),
                    ),
                  ),
                  PricePerDayRichTextWidget(
                    theme: 'White',
                    price: itemsToBeAdded['prices'][index],
                  ),
                ],
              ),
            ],
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: screenWidth * 0.18,
              padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.005,
              ),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(186, 186, 186, 1),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(
                  'Add',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w400,
                    fontSize: screenWidth * 0.035,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
