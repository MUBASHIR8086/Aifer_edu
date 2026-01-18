import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget Errormessage(String message) {
  return Center(
    child: Text(
      message,
      style: const TextStyle(
        color: Colors.red,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
