

import 'package:flutter/material.dart';

extension StringExtension on String {
Color get statusColor => this == 'Alive' ? Colors.green : Colors.red;

}