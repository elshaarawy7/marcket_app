import 'package:flutter/material.dart';
import 'package:market_app/core/utils/widgets/custem_appar.dart';
import 'package:market_app/futcher/chekout_futcher/presentation/ui/views/widgets/my_cart_view_body.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: "My Cart" , 
        onBack: () {
          
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: MyCartViewBody(),
      ),
    );
  }
}
