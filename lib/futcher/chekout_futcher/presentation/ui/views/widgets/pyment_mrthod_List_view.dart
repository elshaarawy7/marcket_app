import 'package:flutter/material.dart';
import 'package:market_app/futcher/chekout_futcher/presentation/ui/views/widgets/pymant_detiles_item.dart';

class PymentMrthodListView extends StatelessWidget {
  const PymentMrthodListView({super.key});

  final List<String> pymentMethodItem  = const [
    "assets/images/Group.svg" , 
    "assets/images/Group.svg" ,
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70, 
      child: ListView.builder(
        itemCount: pymentMethodItem.length, 
        scrollDirection: Axis.horizontal, 
        itemBuilder: (context, index) {
          return PymantDetilesItem(
            isActive: false,
            image: pymentMethodItem[index],
          );
        },
      ),
    );
  }
}