import 'package:flutter/material.dart';

class DashLinCard extends StatelessWidget {
  const DashLinCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        30 , 
        (index)=> Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2), 
            child: Container(
              color: Colors.grey,
              height: 2,), 
          ),
        ) , 
      ),
    );
  }
} 