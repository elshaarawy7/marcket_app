import 'package:flutter/material.dart';

class ThankViewBody extends StatelessWidget {
  const ThankViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20 , left: 20 , top: 100 , bottom: 50), 
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFEDEDED) , 
              borderRadius: BorderRadius.circular(20)
            ),
          ) , 

          Positioned(  
            left: -20,
            bottom: MediaQuery.sizeOf(context).height * .2 ,
            child: CircleAvatar(
              backgroundColor: Colors.white,
            ),
          ) ,  
           Positioned(  
            right: -20,
            bottom: MediaQuery.sizeOf(context).height * .2 ,
            child: CircleAvatar(
              backgroundColor: Colors.white,
            ),
          ) ,  

          Positioned(
            left: 0, 
            right: 0, 
            top: -50,
            child: CircleAvatar(
              backgroundColor: Color(0xFFEDEDED), 
              radius: 50, 
              child: CircleAvatar(
                backgroundColor: Colors.green, 
                radius: 40,
                child: Icon(Icons.check , color: Colors.white , size: 45,),
              ),
            ),
          ) , 

          Positioned(
            child: Center(
              child: Column(
                children: [
              SizedBox(height: 50,) ,
                  Text("Thank you!" , style: TextStyle(
                    color: Colors.black , 
                    fontSize: 30 , 
                    fontWeight: FontWeight.bold , 
                  ),) , 

                  SizedBox(height: 5,) , 

                  Text("Your transaction was successful" , style: TextStyle(
                    color: Colors.black , 
                    fontSize: 20 , 
                    fontWeight: FontWeight.w400, 
                  ),) ,  

                  SizedBox(height: 30,) ,

            

                ],
              ),
            ),
          )
        ],
      ), 
    );
  }
}