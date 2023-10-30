import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:nothing/screens/bike_details_screen.dart';

import '../utils/screen_utils.dart';
import '../widgets/rich_text_widget.dart';
import '../widgets/rich_text_widget_for_price.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  List bikesType = ['Adventure', 'Cruiser', 'Sportsbike', 'Tourer'];
  Map bikesNamesWithCharges = {
    'names': [
      'Meteore',
      'Scout',
      'Rebel',
    ],
    'subType': [
      'Royal Enfield',
      'Bobber Indian',
      '1100 Honda',
    ],
    'prices': [
      '699/',
      '1499/',
      '1199/',
    ],
    'images': [
      'assets/images/metor_1.png',
      'assets/images/metor_2.png',
      'assets/images/big_motor.png',
    ]
  };
  Map recentlyViewed = {
    'names_and_status': [
      {'names': 'Hayabusa', 'status': 'Available'},
      {'names': 'Classic 350', 'status': 'Booked'},
    ],
    'prices': [
      '2000/',
      '1500/',
    ],
    'images': [
      'assets/images/hayabusa.png',
      'assets/images/metor_3.png',
    ]
  };
  int pressedBikeType = 0;

  @override
  Widget build(BuildContext context) {
    double screenHeight = ScreenUtil.screenHeight(context);
    double screenWidth = ScreenUtil.screenWidth(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Top Bar
              buildWelcomeRowWithUserImage(screenWidth, screenHeight),
              //Search Bar
              buildSearchBikeBar(screenWidth, screenHeight),
              //Type Filters
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.007,
                  horizontal: screenWidth * 0.025,
                ),
                height: screenHeight * 0.060,
                child: ListView.builder(
                  shrinkWrap: false,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return buildBikeTypeContainer(
                        index, screenWidth, screenHeight);
                  },
                  itemCount: bikesType.length,
                ),
              ),
              //Rich Text
              const RichTextWidget(
                firstWord: 'Popular',
                secondWord: 'items',
              ),

              //Popular Items Section
              LayoutBuilder(
                builder: (context, constraints) {
                  return ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: screenHeight * 0.33,
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return buildPopularItemsContainer(
                          screenHeight,
                          screenWidth,
                          index,
                        );
                      },
                      itemCount: bikesNamesWithCharges['names'].length,
                    ),
                  );
                },
              ),
              //Rich Text
              const RichTextWidget(
                firstWord: 'Recently',
                secondWord: 'Viewed',
              ),

              //Recently viewed
              ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return buildContainerForRecentlyViewed(
                      screenWidth, screenHeight, index);
                },
                itemCount: recentlyViewed['images'].length,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildContainerForRecentlyViewed(
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
                  recentlyViewed['images'][index],
                  scale: 4,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recentlyViewed['names_and_status'][index]['names'],
                    style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: screenWidth * 0.04,
                    ),
                  ),
                  PricePerDayRichTextWidget(
                    theme: 'White',
                    price: recentlyViewed['prices'][index],
                  ),
                ],
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 10,
            ),
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.005,
                horizontal: screenWidth * 0.012,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: recentlyViewed['names_and_status'][index]['status'] ==
                        'Booked'
                    ? const Color.fromRGBO(186, 186, 186, 1)
                    : Colors.black,
              ),
              child: Text(
                recentlyViewed['names_and_status'][index]['status'],
                style: TextStyle(
                  color: recentlyViewed['names_and_status'][index]['status'] ==
                          'Booked'
                      ? Colors.black
                      : Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  GestureDetector buildPopularItemsContainer(
      double screenHeight, double screenWidth, int index) {
    return GestureDetector(
      onTap: () {
        debugPrint('1');
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => const BikeDetailsScreen(),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.018, vertical: screenHeight * 0.015),
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.001,
          vertical: screenHeight * 0.005,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade700,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: screenHeight * 0.196,
              width: screenWidth * 0.4,
              child: Image.asset(
                bikesNamesWithCharges['images'][index],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 5,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bikesNamesWithCharges['names'][index],
                    style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    bikesNamesWithCharges['subType'][index],
                    style: GoogleFonts.robotoSlab(
                      color: Colors.black,
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  PricePerDayRichTextWidget(
                    price: bikesNamesWithCharges['prices'][index].toString(),
                    theme: 'White',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildSearchBikeBar(double screenWidth, double screenHeight) {
    return Container(
      margin: EdgeInsets.fromLTRB(
        screenWidth * 0.07,
        screenHeight * 0.025,
        screenWidth * 0.06,
        screenHeight * 0.025,
      ),
      child: TextFormField(
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(
            screenWidth * 0.08,
            screenHeight * 0.0015,
            screenWidth * 0.06,
            screenHeight * 0.0015,
          ),
          hintText: 'Search Bike',
          hintStyle: GoogleFonts.roboto(
            color: const Color.fromRGBO(210, 207, 207, 1),
            fontWeight: FontWeight.w500,
            fontSize: screenWidth * 0.06,
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: Color.fromRGBO(210, 207, 207, 1),
          ),
          fillColor: const Color.fromRGBO(239, 238, 238, 1),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none, // Remove border
          ),
        ),
      ),
    );
  }

  Padding buildWelcomeRowWithUserImage(
      double screenWidth, double screenHeight) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          screenWidth * 0.07, screenHeight * 0.025, screenWidth * 0.07, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(right: screenWidth * 0.05),
            child: CircleAvatar(
              radius: screenWidth * 0.07,
              backgroundImage: const AssetImage(
                'assets/images/Ellipse.png',
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome',
                style: GoogleFonts.roboto(
                  color: const Color.fromRGBO(140, 126, 126, 1),
                  fontSize: screenWidth * 0.04,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                'Anhi Tiwari',
                style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: screenWidth * 0.045,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  GestureDetector buildBikeTypeContainer(
      int index, double screenWidth, double screenHeight) {
    return GestureDetector(
      onTap: () {
        setState(() {
          pressedBikeType = index;
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: screenWidth * 0.008),
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.04, vertical: screenHeight * 0.015),
        decoration: BoxDecoration(
          color: pressedBikeType == index ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.black,
          ),
        ),
        child: Text(
          bikesType[index],
          style: GoogleFonts.roboto(
            fontSize: screenWidth * 0.04,
            fontWeight: FontWeight.w400,
            color: pressedBikeType == index ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
