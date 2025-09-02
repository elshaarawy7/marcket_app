import 'package:flutter/material.dart';

class CustemBatton extends StatelessWidget {
  const CustemBatton({super.key, required this.text, this.onPressed , this.isLoding = false});

  final String text;
  final void Function()? onPressed;
  final bool isLoding ;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(12),
        ),
      ),
      child: isLoding ? CircularProgressIndicator() : Text(
        text,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
