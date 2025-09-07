import 'package:flutter/material.dart';
import 'package:market_app/core/utils/custem_batton.dart';
import 'package:market_app/futcher/chekout_futcher/presentation/ui/views/widgets/custem_batton_bloc_cunsumer.dart';
import 'package:market_app/futcher/chekout_futcher/presentation/ui/views/widgets/pyment_mrthod_List_view.dart';

class PymrntMethodBattomShet extends StatefulWidget {
  const PymrntMethodBattomShet({super.key});

  @override
  State<PymrntMethodBattomShet> createState() => _PymrntMethodBattomShetState();
}

class _PymrntMethodBattomShetState extends State<PymrntMethodBattomShet> {

  bool isPaypal = false;

  void updatePaymantMetod({required int index}) {
    setState(() {
      if (index == 0) {
        isPaypal = false;
      } else {
        isPaypal = true;
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PymentMrthodListView(
            upDatePatmentMethod: updatePaymantMetod,
          ),

          SizedBox(height: 32),

          CustemBattonBlocconsumer(
            isPaypal: isPaypal,
          ),
        ],
      ),
    );
  }
}
