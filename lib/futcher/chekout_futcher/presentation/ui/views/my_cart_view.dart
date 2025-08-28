import 'package:flutter/material.dart';
import 'package:market_app/futcher/chekout_futcher/presentation/ui/views/widgets/my_cart_view_body.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "My Cart",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: Icon(Icons.arrow_back, color: Colors.black, size: 40),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: MyCartViewBody(),
      ),
    );
  }
}
