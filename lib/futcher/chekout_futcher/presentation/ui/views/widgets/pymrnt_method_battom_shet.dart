import 'package:flutter/material.dart';
import 'package:market_app/core/utils/custem_batton.dart';
import 'package:market_app/futcher/chekout_futcher/presentation/ui/views/widgets/pyment_mrthod_List_view.dart';

class PymrntMethodBattomShet extends StatelessWidget {
  const PymrntMethodBattomShet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PymentMrthodListView(),

          SizedBox(height: 32),

          CustemBatton(text: "Contanou", onPressed: () {}),
        ],
      ),
    );
  }
}
