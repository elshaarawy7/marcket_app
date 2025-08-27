import 'package:flutter/material.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, 
      appBar: AppBar(
        title: Text("My Cart" , style: TextStyle(
          color: Colors.black , 
          fontSize: 20 , 
          fontWeight: FontWeight.bold , 
        ),)  
      
      ), 
      body: Column(
        children: [
          
        ],
      ),
    );
  }
}