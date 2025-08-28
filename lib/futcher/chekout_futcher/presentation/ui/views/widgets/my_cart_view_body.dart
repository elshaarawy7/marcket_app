import 'package:flutter/material.dart';
import 'package:market_app/core/utils/custem_batton.dart';
import 'package:market_app/futcher/chekout_futcher/presentation/ui/views/widgets/item_widgets.dart';
import 'package:market_app/futcher/chekout_futcher/presentation/ui/views/widgets/total_price.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset("assets/images/Group 6.png" , height: 500, width: 400,) , 
          SizedBox(height: 20,) , 
          ItemWidgets() , 
          SizedBox(height: 5,) , 
          Divider( 
            color: Colors.grey, 
            height: 32,  
          ) ,  

          TotalPrice(
            title: "Total", 
            value: r'50.97',
          ) ,  

          CustemBatton(
            text: "Complete Payment" , 
            onPressed: () {
              
            }, 
            )
          
        ],
      ),
    );
  }
}