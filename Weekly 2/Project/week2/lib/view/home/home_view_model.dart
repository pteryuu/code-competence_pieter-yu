import 'package:flutter/material.dart';

class HomeViewModel with ChangeNotifier {
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController help = TextEditingController();

  TextEditingController get getFirstname => firstName;
  TextEditingController get getLastName => lastName;
  TextEditingController get getEmail => email;
  TextEditingController get getHelp => help;

  updateFirstName(String val) {
    val = firstName.text;
    notifyListeners();
  }

  updateLastName(String val) {
    val = lastName.text;
    notifyListeners();
  }
}
