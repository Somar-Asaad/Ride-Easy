import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remixicon/remixicon.dart';

class EmergencyScreen extends StatefulWidget {
  const EmergencyScreen({super.key});

  @override
  State<EmergencyScreen> createState() => _EmergencyScreenState();
}

class _EmergencyScreenState extends State<EmergencyScreen> {
  final _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Emergency",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(
            Remix.arrow_left_s_line,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "How can we help you ?",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "In case of any emergency we will share your live location and send a message to the phone number you specify here",
              style: TextStyle(
                color: Color.fromRGBO(170, 170, 170, 1),
                fontSize: 15,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              "Emergency contact number",
              style: TextStyle(
                color: Color.fromRGBO(153, 153, 153, 1),
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Mobile number",
              style: TextStyle(
                color: Color.fromRGBO(153, 153, 153, 1),
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: _phoneNumberController,
              decoration: const InputDecoration(
                prefixText: "+91 ",
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
              cursorColor: Colors.black,
              keyboardType: TextInputType.phone,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(10),
              ],
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your phone number';
                } else if (value.length < 10) {
                  return 'Please enter a valid phone number';
                }
                return null;
              },
            ),
            const Spacer(),
            Center(
              child: TextButton(
                onPressed: () {Navigator.of(context).pop();},
                child: const Text(
                  "Done",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}