import 'package:flutter/material.dart';
import 'package:market_app/futcher/chekout_futcher/presentation/ui/views/widgets/pymant_detiles_view.dart';

class PymantDetils extends StatelessWidget {
  const PymantDetils({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: PymantDetilesBody(), 
    );
  }
}