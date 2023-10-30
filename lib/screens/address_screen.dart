import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:nothing/widgets/top_title_widget.dart';

import '../widgets/customized_button.dart';
import '../widgets/text_field_with_title.dart';


class EditAddress extends StatefulWidget {
  const EditAddress(
      {Key? key, this.addressIdNeedToBeEdited, this.currentDefaultAddressId})
      : super(key: key);
  final String? addressIdNeedToBeEdited;
  final String? currentDefaultAddressId;

  @override
  State<EditAddress> createState() => _EditAddressState();
}

class _EditAddressState extends State<EditAddress> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const TopTitle(title: 'Address'),
                const Row(
                  children: [
                    Expanded(
                      child: TextFieldWithTitle(
                        title: 'Flat, Room No',
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextFieldWithTitle(
                        title: 'Edit Tag',
                      ),
                    ),
                  ],
                ),
                const TextFieldWithTitle(
                  title: 'Address',
                ),
                const TextFieldWithTitle(
                  title: 'City',
                ),
                const TextFieldWithTitle(
                  title: 'State.',
                ),
                const TextFieldWithTitle(
                  title: 'country.',
                ),
                const TextFieldWithTitle(
                  title: 'Pin Code',
                ),
                Row(
                  children: <Widget>[
                    Checkbox(
                      checkColor: Colors.grey,
                      shape: const CircleBorder(),
                      value: _isSelected,
                      activeColor: Colors.grey,
                      onChanged: (bool? value) {
                        setState(() {
                          _isSelected = value!;
                        });
                      },
                    ),
                    Text(
                      "Set as default",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.10,
                ),
                Align(
                  alignment: Alignment.center,
                  child: CustomizedButton(
                    radius: BorderRadius.circular(0),
                    text: 'Edit Address',
                    width: double.infinity,
                    color: Colors.black,
                    textStyle: GoogleFonts.roboto(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
