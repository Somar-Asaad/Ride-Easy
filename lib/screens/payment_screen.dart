import 'package:flutter/material.dart';
import 'package:nothing/widgets/top_title_widget.dart';
import 'package:remixicon/remixicon.dart';

import '../widgets/elevated_button_widget.dart';
import '../widgets/text_botton_widget.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  int pressedCardNumber = 1;
  Map paymentInfo = {
    'Categories': [
      'Package Cost ',
      'Convient Fee',
      'Discount',
      'Total Fair',
    ],
    'Prices': [
      '\$250.00',
      '\$15.00',
      '\$5.00',
      '\$260.00',
    ],
  };

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TopTitle(title: 'Payment'),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.07, vertical: height * 0.02),
                child: Row(
                  children: [
                    const Text(
                      'Payment',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      width: width * 0.07,
                    ),
                    buildCircleAvatar(Colors.black, '01'),
                    buildDivider(),
                    buildCircleAvatar(Colors.grey.shade500, '02'),
                    buildDivider(),
                    buildCircleAvatar(Colors.grey.shade500, '03'),
                  ],
                ),
              ),
              Container(
                height: height * 0.25,
                width: double.infinity,
                margin: EdgeInsets.symmetric(
                    horizontal: width * 0.07, vertical: height * 0.02),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      image: AssetImage(
                        'assets/images/map.png',
                      ),
                      fit: BoxFit.cover),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: width * 0.07, vertical: height * 0.01),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Choose Payment',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    pressedCardNumber = 1;
                  });
                },
                child: buildContainer(
                    Container(
                      padding: EdgeInsets.zero,
                      child: Stack(
                        alignment: AlignmentDirectional.centerStart,
                        children: [
                          const CircleAvatar(
                            radius: 18,
                            backgroundColor: Colors.red,
                          ),
                          Positioned(
                            left: 18,
                            child: CircleAvatar(
                              radius: 18,
                              backgroundColor: Colors.orange.withOpacity(0.8),
                            ),
                          ),
                        ],
                      ),
                    ),
                    'Master Card',
                    '545A 5556 2020',
                    width,
                    height,
                    pressedCardNumber,
                    1),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    pressedCardNumber = 2;
                  });
                },
                child: buildContainer(
                    Container(
                      alignment: Alignment.center,
                      child: const Icon(
                        Remix.money_dollar_box_fill,
                        size: 35,
                      ),
                    ),
                    'Pay by Cash',
                    'Pay after ride',
                    width,
                    height,
                    pressedCardNumber,
                    2),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: width * 0.07, vertical: height * 0.01),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Promo Code',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: width * 0.07, vertical: height * 0.01),
                child: TextFormField(
                  controller: _textEditingController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                    disabledBorder:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    border:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    fillColor: Colors.grey.shade300,
                    filled: true,
                    suffixIcon: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Apply',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    hintText: 'Enter Promo Code',
                    hintStyle: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 15,
                      textBaseline: TextBaseline.alphabetic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.08,
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: width * 0.1, vertical: height * 0.01),
                width: double.infinity,
                child: ElevatedButtonWidget(
                  title: 'Continue',
                  titleColor: Colors.white,
                  color: Colors.black,
                  onTap: () {},
                ),
              ),
              TextButtonWidget(
                onTap: () {},
                title: 'Back',
                textColor: Colors.black,
                backgroundColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector buildContainer(
      icon, text, subText, width, height, pressedCardNumber, index) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: width * 0.07, vertical: height * 0.007),
        padding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 5,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade500),
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                child: icon,
                margin: const EdgeInsets.symmetric(horizontal: 10),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: const TextStyle(
                    color: Colors.black,
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: height * 0.006,
                ),
                Text(
                  subText,
                  style: TextStyle(
                    color: Colors.grey.shade400,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -0.5,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.all(10),
              child: CircleAvatar(
                radius: 8,
                backgroundColor:
                    pressedCardNumber == index ? Colors.black : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Flexible buildDivider() {
    return const Flexible(
      child: Divider(
        thickness: 2,
        color: Colors.grey,
        indent: 5,
        endIndent: 5,
      ),
    );
  }

  CircleAvatar buildCircleAvatar(backgroundColor, title) {
    return CircleAvatar(
      backgroundColor: backgroundColor,
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
