import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/core/utils/custem_batton.dart';
import 'package:market_app/futcher/chekout_futcher/presentation/logic/manger/cubit/payemnt_cubit.dart';
import 'package:market_app/futcher/chekout_futcher/presentation/ui/views/thank_view.dart';

class CustemBattonBlocconsumer extends StatelessWidget {
  const CustemBattonBlocconsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PayemntCubit, PayemntState>(
      listener: (context, state) {
       if(state is PayemntSucsess){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
          return ThankView() ;
        })) ;
       } 

       if(state is PayemntFuiler){
        SnackBar  sanckBar = SnackBar(content: Text(state.errMasseg)) ; 
        ScaffoldMessenger.of(context).showSnackBar(sanckBar);
       }
      },
      builder: (context, state) {
        return CustemBatton(
          isLoding: state is PayemntLoding ? true : false ,
          text: "Contanou", onPressed: () {});
      },
    );
  }
}
