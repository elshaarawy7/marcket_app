import 'dart:ui';

import 'package:flutter/material.dart';

AppBar customAppBar({required String title, VoidCallback? onBack}) {
  return AppBar(
    backgroundColor: Colors.white,
    centerTitle: true,
    title: Text(
      title,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    leading: IconButton(
      icon: const Icon(Icons.arrow_back, color: Colors.black, size: 30),
      onPressed: onBack,
    ),
    elevation: 0, 
  );
}
