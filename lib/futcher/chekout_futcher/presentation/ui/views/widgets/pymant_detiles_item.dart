import 'package:flutter/material.dart';

class PymantDetilesItem extends StatelessWidget {
  const PymantDetilesItem({super.key, this.isActive = false, required this.image});

  final bool isActive;
  final String image ;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:MainAxisAlignment.center,
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 300),
          padding: EdgeInsets.all(12),
          height: 70,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            border: Border.all(
              color: isActive ? Colors.green : Colors.white,
              width: 2,
            ),
          ),
          child: Image.asset(image),
        ), 
         
         SizedBox(height: 20,) , 

        AnimatedContainer(
          duration: Duration(milliseconds: 300),
          padding: EdgeInsets.all(12),
          height: 70,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            border: Border.all(
              color: isActive ? Colors.green : Colors.white,
              width: 2,
            ),
          ),
          child: Image.asset(image),
        ),

      
      ],
    );
  }
}
