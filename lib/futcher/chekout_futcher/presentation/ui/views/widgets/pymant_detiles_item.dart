import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PymantDetilesItem extends StatelessWidget {
  const PymantDetilesItem({super.key, this.isActive = false, required this.image});

  final bool isActive;
  final String image ;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:MainAxisAlignment.center,
      children: [
        
         
         SizedBox(height: 20,) , 

         AnimatedContainer(
          duration: Duration(milliseconds: 300),
          padding: EdgeInsets.all(12),
          height: 63,
          width: 103,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15) , 
              side: BorderSide(
                width: 1.50 , 
                color: isActive ? Colors.green : Colors.grey , 
              )

            ),
            
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15) , 
            color: Colors.white , 
            ), 
            child: Center(
              child: SvgPicture.asset(image),
            ),
          )
        ), 

      
      ],
    );
  }
}
