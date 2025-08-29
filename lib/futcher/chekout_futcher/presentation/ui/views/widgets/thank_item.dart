import 'package:flutter/material.dart';

class ThankItem extends StatelessWidget {
  const ThankItem({super.key});

  @override
  Widget build(BuildContext context) {
    return     Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12 ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                    children: [
                  
                      Text("Date" , style: TextStyle(
                        color: Colors.black , 
                        fontSize: 18 , 
                        fontWeight: FontWeight.w600 , 
                      ),) ,  

                      Text("01/24/2023" , style: TextStyle(
                        color: Colors.black , 
                        fontSize: 18 , 
                        fontWeight: FontWeight.w600 , 
                      ),) ,
                    ],
                  ),
                );
  }
}