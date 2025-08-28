import 'package:flutter/material.dart';

class ItemWidgets extends StatelessWidget {
  const ItemWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column( 
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, 
          children: [
            Text("Order Subtotal" , style: TextStyle(
              color: Colors.black , 
              fontSize: 20 , 
              fontWeight: FontWeight.w500, 
            ),) ,  

            Text(r"$42.97" , style: TextStyle(
              color: Colors.black , 
              fontSize: 20 , 
              fontWeight: FontWeight.w500 , 
            ),) ,  
          ],
        ) ,  

        SizedBox(height: 5,) , 

          Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, 
          children: [
            Text("Discount" , style: TextStyle(
              color: Colors.black , 
              fontSize: 20 , 
              fontWeight: FontWeight.w500, 
            ),) ,  

            Text(r"$0" , style: TextStyle(
              color: Colors.black , 
              fontSize: 20 , 
              fontWeight: FontWeight.w500 , 
            ),) ,  
          ],
        ) , 

        SizedBox(height: 5,) , 

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, 
          children: [
            Text("Shipping" , style: TextStyle(
              color: Colors.black , 
              fontSize: 20 , 
              fontWeight: FontWeight.w500, 
            ),) ,  

            Text(r"$8" , style: TextStyle(
              color: Colors.black , 
              fontSize: 20 , 
              fontWeight: FontWeight.w500 , 
            ),) ,  
          ],
        ) , 

      ],
    );
  }
}