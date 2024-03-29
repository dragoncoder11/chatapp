import 'package:chatapp/core/utils/constants.dart';
import 'package:flutter/material.dart';

abstract class Styles{
  static const styles24bold= TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 24,
  );
   static const TextStyle styles14w400= TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: Colors.white
  );
   static const TextStyle styles12w400= TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 12,
    color: kgreycolor
  );
   static const TextStyle styles10w400= TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 10,
    color: kgreycolor
  );
    static const TextStyle styles16w600= TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 16,
  );
   static const TextStyle styles18w600= TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 18,
  );
}