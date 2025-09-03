import 'package:flutter/material.dart';
import 'package:market_app/core/utils/custem_batton.dart';
import 'package:market_app/futcher/chekout_futcher/data/model/repo/cheak_out_repo_ipml.dart';
import 'package:market_app/futcher/chekout_futcher/presentation/logic/manger/cubit/payemnt_cubit.dart';
import 'package:market_app/futcher/chekout_futcher/presentation/ui/views/widgets/item_widgets.dart';
import 'package:market_app/futcher/chekout_futcher/presentation/ui/views/widgets/pymrnt_method_battom_shet.dart';
import 'package:market_app/futcher/chekout_futcher/presentation/ui/views/widgets/total_price.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Expanded(
            child: Image.asset(
              "assets/images/Group 6.png",
              height: 500,
              width: 400,
            ),
          ),
          SizedBox(height: 20),
          ItemWidgets(),
          SizedBox(height: 5),
          Divider(color: Colors.grey, height: 32),

          TotalPrice(title: "Total", value: r'50.97'),

          CustemBatton(
            text: "Complete Payment",
            onPressed: () {
              // Navigator.push(
              // context,
              // MaterialPageRoute(builder: (context) => PymantDetils());
              //);

              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return BlocProvider(
                    create: (context) => PayemntCubit(CheakOutRepoIpml()),
                    child: PymrntMethodBattomShet(),
                  );
                },
              );
            },
          ),

          SizedBox(height: 20),
        ],
      ),
    );
  }
}
