import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:market_app/futcher/chekout_futcher/presentation/ui/views/widgets/thank_item.dart';
import 'package:market_app/futcher/chekout_futcher/presentation/ui/views/widgets/total_price.dart';

class ThankViewBody extends StatelessWidget {
  const ThankViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20 , left: 20 , top: 100 , bottom: 50), 
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          TankYouCard() , 

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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
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
                
                    ThankItem(text: "Date", vlaue: "1/8/2025") , 
                     ThankItem(text: "Time", vlaue: "10.15 Am") , 
                      ThankItem(text: "To", vlaue: "Sam Louis") ,  
                
                      SizedBox(height: 10,) ,
                
                      Divider(
                      color: Colors.grey,
                                            ) ,  
                
                      TotalPrice(title: "Total", value: r"$50") , 

                      SizedBox(height: 50,) , 

                    Container(
                      height: 100, 
                      width: 300,
                      decoration: BoxDecoration(
                        color: Colors.white , 
                        borderRadius: BorderRadius.circular(12) , 
                        
                      ),  

                      child: Row(
                        children: [
                          SvgPicture.asset("assets/images/logo.svg" , height: 40,) ,

                          SizedBox(width: 20,) ,
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Credit Card" , style: TextStyle(
                                color: Colors.black , 
                                fontSize: 20 , 
                                fontWeight: FontWeight.w400 , 
                              ),), 

                              SizedBox(height: 5,) , 

                              Text("Mastercard **78" , style: TextStyle(
                                color: Colors.black , 
                                fontSize: 20 , 
                                fontWeight: FontWeight.w400 , 
                              ),),
                            ],
                          )
                        ],
                      ),
                    ) , 
                    SizedBox(height: 70,) , 

                    Positioned(
                      left: 20 +16 , 
                      right: 20 +16, 
                      bottom: MediaQuery.sizeOf(context).height * .2 + 20,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DashLinCard(),
                      ),
                    ) ,     
                  ],
                ),
              ),
            ),
          )
        ],
      ), 
    );
  }
}

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



class TankYouCard extends StatelessWidget {
  const TankYouCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFEDEDED) , 
        borderRadius: BorderRadius.circular(20)
      ),
    );
  }
}