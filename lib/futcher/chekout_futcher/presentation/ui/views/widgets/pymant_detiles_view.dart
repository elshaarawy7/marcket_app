import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:market_app/core/utils/custem_batton.dart';
import 'package:market_app/futcher/chekout_futcher/presentation/ui/views/thank_view.dart';
import 'package:market_app/futcher/chekout_futcher/presentation/ui/views/widgets/custem_created_card.dart';
import 'package:market_app/futcher/chekout_futcher/presentation/ui/views/widgets/pyment_mrthod_List_view.dart';

class PymantDetilesBody extends StatefulWidget {
  const PymantDetilesBody({super.key}); 

  @override
  State<PymantDetilesBody> createState() => _PymantDetilesBodyState();
}

class _PymantDetilesBodyState extends State<PymantDetilesBody> {
    final GlobalKey<FormState> formKey = GlobalKey() ; 

    AutovalidateMode autovalidateMode = AutovalidateMode.disabled ;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
      
         SliverToBoxAdapter(child: PymentMrthodListView()) , 
          SliverToBoxAdapter(
          child: SizedBox(height: 30,),
         ) ,
         SliverToBoxAdapter(child: CustemCreatedCard(
          formKey: formKey,
          autovalidateMode: autovalidateMode,
         )) ,

         SliverToBoxAdapter(
          child: SizedBox(height: 30,),
         ) ,
         SliverToBoxAdapter(


          child: Align(
            alignment: Alignment.bottomCenter,
            child: CustemBatton(
              text: "Pay", 
              onPressed: () {
                if(formKey.currentState!.validate()){
                  formKey.currentState!.save();
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                    return ThankView() ;
                  }));
                  log("pymant") ; 
                } else {
                  
                  autovalidateMode = AutovalidateMode.always ;
                  setState(() {
                    
                  });
                }
              },
            ),
          ),
         ) , 
      ]
    );
  }
}
