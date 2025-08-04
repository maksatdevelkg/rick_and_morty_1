import 'package:flutter/material.dart';

class ProfileProvider extends ChangeNotifier {
  String _firstName = '';
  String _lastName = '';
  String _middleName = '';
  String _loginName = '';

  String get firstName => _firstName;
  String get lastName => _lastName;
  String get middleName => _middleName;
  String get loginName => _loginName;

  void updateProfile({
    String? firstName,
    String? lastName,
    String? middleName,
    String? loginName
  }) {
    if (firstName != null) _firstName = firstName;
    if (lastName != null) _lastName = lastName;
    if (middleName != null) _middleName = middleName;
    if (loginName != null) _loginName = loginName;
    notifyListeners(); 
  }
}