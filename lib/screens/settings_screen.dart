import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import 'package:nothing/widgets/top_title_widget.dart';
import 'package:remixicon/remixicon.dart';

import '../controllers/select_language_controller.dart';
import 'emergency_screen.dart';

enum Languages { english, deutsche, hindi }

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isSwitchOn = false;
  final SelectLanguageController languageController =
      Get.put(SelectLanguageController());

  void _toggleSwitch(bool value) {
    setState(() {
      isSwitchOn = !isSwitchOn;
    });
  }

  Future<void> _selectLanguage() {
    //TODO: implement radio button as in design
    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),
      context: context,
      builder: (ctx) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding:
                  EdgeInsets.only(top: 15, bottom: 20, left: 15, right: 15),
              child: Text(
                "Select language",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            LanguageTile(
              languageController: languageController,
              title: 'English (US)',
              language: "English",
              imagePath: const Flag.fromString('Us'),
            ),
            LanguageTile(
              languageController: languageController,
              title: 'Hindi',
              language: "Hindi",
              imagePath: const Flag.fromString('IN'),
            ),
            LanguageTile(
              languageController: languageController,
              title: 'Italy',
              language: "Italy",
              imagePath: const Flag.fromString('IT'),
            ),
            LanguageTile(
              languageController: languageController,
              title: "Deutche",
              language: "Deutche",
              imagePath: const Flag.fromString('DE'),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          const TopTitle(title: 'Settings'),
          ListTileSwitch(
            leading: const Padding(
              padding: EdgeInsets.only(top: 5),
              child: Icon(
                Remix.notification_2_fill,
                color: Colors.black,
              ),
            ),
            title: const Text("Notifications"),
            subtitle: Text(isSwitchOn ? "Currently on" : "Currently off"),
            value: isSwitchOn,
            onChanged: _toggleSwitch,
            switchScale: 0.5,
            switchActiveColor: const Color.fromRGBO(32, 161, 61, 1),
          ),
          SettingTiles(
            icon: const Icon(Remix.alarm_warning_fill, color: Colors.black),
            title: "Emergency",
            subtitle: "Manage contacts",
            function: () {
              debugPrint("Emegency");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EmergencyScreen(),
                ),
              );
            },
          ),
          SettingTiles(
            icon: const Icon(Remix.earth_fill, color: Colors.black),
            title: "Language",
            subtitle: "English (United Kingdom)",
            function: _selectLanguage,
          ),
          SettingTiles(
            icon: const Icon(Remix.star_fill,
                color: Color.fromRGBO(238, 199, 59, 1)),
            title: "Enjoying the app?",
            subtitle: "Rate us",
            function: () {
              debugPrint("Rating");
            },
          ),
          const Spacer(),
          TextButton(
              onPressed: () {},
              child: const Text(
                'Delete Account',
                style: TextStyle(color: Colors.black),
              )),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}

class LanguageTile extends StatelessWidget {
  const LanguageTile({
    super.key,
    required this.languageController,
    required this.title,
    required this.language,
    required this.imagePath,
  });

  final SelectLanguageController languageController;
  final String? title;
  final String? language;
  final Widget imagePath;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 40,
        child: imagePath,
      ),
      title: Text(title!),
      trailing: Obx(() => Radio(
            value: language,
            groupValue: languageController.language,
            onChanged: (value) => languageController.setLanguage(value!),
          )),
      shape: const Border(
        bottom: BorderSide(color: Colors.grey),
      ),
      contentPadding:
          const EdgeInsets.only(top: 8, bottom: 8, right: 15, left: 15),
      tileColor: languageController.language == title
          ? Colors.grey.shade100
          : Colors.transparent,
    );
  }
}

class SettingTiles extends StatelessWidget {
  const SettingTiles(
      {required this.icon,
      required this.title,
      required this.subtitle,
      required this.function,
      super.key});

  final String? title;
  final String? subtitle;
  final Icon? icon;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Padding(padding: const EdgeInsets.only(top: 5), child: icon),
      title: Text(title!),
      subtitle: Text(subtitle!),
      onTap: function,
    );
  }
}
