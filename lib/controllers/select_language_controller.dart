import 'package:get/get.dart';

class SelectLanguageController extends GetxController {
  final _language = "English".obs;

  String get language => _language.value;

  setLanguage(String language) {
    _language.value = language;
  }
}